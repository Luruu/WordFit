//
//  ActionCameraController.swift
//  WordFit
//
//  Created by Mario Oliva on 26/10/21.
//

import UIKit
import AVFoundation
import Vision
import SwiftUI


final class ActionCameraController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    var detectionOverlay: CALayer! = nil
    let detectPlayerRequest = VNDetectHumanBodyPoseRequest()
    let bodyPoseDetectionMinConfidence: VNConfidence = 0.6
    let bodyPoseRecognizedPointMinConfidence: VNConfidence = 0.1
    var playerStats = PlayerStats()
//    let c = MPCManager.sharedInstance
    weak var delegate: ActionCameraDelegate?
    
    private let playerBoundingBox = BoundingBoxView()
    private let jointSegmentView = JointSegmentView()
    private var throwRegion = CGRect.null
    private var targetRegion = CGRect.null
    private var playerDetected = false
    
    // Vision parts
    var requests = [VNRequest]()
    
    var previewView: UIView!
    
    var bufferSize: CGSize = .zero
    var rootLayer: CALayer! = nil
    
    private let session = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer! = nil
    private let videoDataOutput = AVCaptureVideoDataOutput()
    private var cameraFeedView: CameraFeedView!
    private var videoRenderView: VideoRenderView!
    
    private let videoDataOutputQueue = DispatchQueue(label: "VideoDataOutput", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
     func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // to be implemented in the subclass
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        
        let exifOrientation = exifOrientationFromDeviceOrientation()
        
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: exifOrientation, options: [:])
        do {
            try imageRequestHandler.perform([detectPlayerRequest])
            
            if let result = detectPlayerRequest.results?.first {
                let box = humanBoundingBox(for: result)
                playerDetected = true
                
                let boxView = playerBoundingBox
                DispatchQueue.main.async {
                    let inset: CGFloat = -20.0
                    let viewRect = self.viewRectForVisionRect(box).insetBy(dx: inset, dy: inset)
                    self.updateBoundingBox(boxView, withRect: viewRect)
//                    if !self.playerDetected && !boxView.isHidden {
//                        self.gameManager.stateMachine.enter(GameManager.DetectedPlayerState.self)
//                    }
                }
                
                DispatchQueue.main.async {
//                    print(self.playerStats.poseObservations.count)
                    
                    if self.playerStats.poseObservations.count == 75 {
//                        self.playerStats.getPrediction() ?? ""
                        
                        let res = self.playerStats.getPrediction()!
                        print(res)
                        
                        self.delegate?.actionRecognized(of: res)
                        
//                        self.c.sendData(text: res)
                        
                        self.playerStats.resetObservations()
                    }
                }
            } else {
                // Hide player bounding box
                DispatchQueue.main.async {
                    self.playerDetected = false
                    if !self.playerBoundingBox.isHidden {
                        self.playerBoundingBox.isHidden = true
                        self.jointSegmentView.resetView()
                    }
                }
            }
        } catch {
            print(error)
        }
    }

    
    func viewRectForVisionRect(_ visionRect: CGRect) -> CGRect {
        let flippedRect = visionRect.applying(CGAffineTransform.verticalFlip)
        let viewRect: CGRect
        
        viewRect = previewLayer.layerRectConverted(fromMetadataOutputRect: flippedRect)
        
        return viewRect
    }
    
    func humanBoundingBox(for observation: VNHumanBodyPoseObservation) -> CGRect {
        var box = CGRect.zero
        var normalizedBoundingBox = CGRect.null
        // Process body points only if the confidence is high.
        guard observation.confidence > bodyPoseDetectionMinConfidence, let points = try? observation.recognizedPoints(forGroupKey: .all) else {
            return box
        }
        // Only use point if human pose joint was detected reliably.
        for (_, point) in points where point.confidence > bodyPoseRecognizedPointMinConfidence {
            normalizedBoundingBox = normalizedBoundingBox.union(CGRect(origin: point.location, size: .zero))
        }
        if !normalizedBoundingBox.isNull {
            box = normalizedBoundingBox
        }
        // Fetch body joints from the observation and overlay them on the player.
        //let joints = getBodyJointsFor(observation: observation)
//        DispatchQueue.main.async {
//            self.jointSegmentView.joints = joints
//        }
        
        // Store the body pose observation in playerStats when the game is in TrackThrowsState.
        // We will use these observations for action classification once the throw is complete.
        
        playerStats.storeObservation(observation)
            
        return box
    }
    
    func updateBoundingBox(_ boundingBox: BoundingBoxView, withRect rect: CGRect?) {
        // Update the frame for player bounding box
        boundingBox.frame = rect ?? .zero
        boundingBox.perform(transition: (rect == nil ? .fadeOut : .fadeIn), duration: 0.1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAVCapture()
    }
    
    func setUIElements() {
        playerBoundingBox.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        playerBoundingBox.backgroundOpacity = 0
        playerBoundingBox.isHidden = true
        view.addSubview(playerBoundingBox)
        view.addSubview(jointSegmentView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupAVCapture() {
        var deviceInput: AVCaptureDeviceInput!
        
        // Select a video device, make an input
        let videoDevice = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .front).devices.first
        do {
            deviceInput = try AVCaptureDeviceInput(device: videoDevice!)
        } catch {
            print("Could not create video device input: \(error)")
            return
        }
        
        session.beginConfiguration()
        session.sessionPreset = .vga640x480 // Model image size is smaller.
        
        // Add a video input
        guard session.canAddInput(deviceInput) else {
            print("Could not add video device input to the session")
            session.commitConfiguration()
            return
        }
        session.addInput(deviceInput)
        if session.canAddOutput(videoDataOutput) {
            session.addOutput(videoDataOutput)
            // Add a video data output
            videoDataOutput.alwaysDiscardsLateVideoFrames = true
            videoDataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)]
            videoDataOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
        } else {
            print("Could not add video data output to the session")
            session.commitConfiguration()
            return
        }
        let captureConnection = videoDataOutput.connection(with: .video)
        // Always process the frames
        captureConnection?.isEnabled = true
        do {
            try  videoDevice!.lockForConfiguration()
            let dimensions = CMVideoFormatDescriptionGetDimensions((videoDevice?.activeFormat.formatDescription)!)
            bufferSize.width = CGFloat(dimensions.width)
            bufferSize.height = CGFloat(dimensions.height)
            videoDevice!.unlockForConfiguration()
        } catch {
            print(error)
        }
        session.commitConfiguration()
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        previewView = UIView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        previewView.contentMode = UIView.ContentMode.scaleAspectFit
        view.addSubview(previewView)
        
        rootLayer = previewView.layer
        previewLayer.frame = rootLayer.bounds
        rootLayer.addSublayer(previewLayer)
        
        // setup Vision parts
        setupLayers()
        updateLayerGeometry()
        //setupVision()
        
        setUIElements()
        // start the capture
        startCaptureSession()
    }
    
    func setupVideoOutputView(_ videoOutputView: UIView) {
        videoOutputView.translatesAutoresizingMaskIntoConstraints = false
        videoOutputView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(videoOutputView)
        NSLayoutConstraint.activate([
            videoOutputView.leftAnchor.constraint(equalTo: view.leftAnchor),
            videoOutputView.rightAnchor.constraint(equalTo: view.rightAnchor),
            videoOutputView.topAnchor.constraint(equalTo: view.topAnchor),
            videoOutputView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func startCaptureSession() {
        session.startRunning()
    }
    
    // Clean up capture setup
    func teardownAVCapture() {
        previewLayer.removeFromSuperlayer()
        previewLayer = nil
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput, didDrop didDropSampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // print("frame dropped")
    }
    
    public func exifOrientationFromDeviceOrientation() -> CGImagePropertyOrientation {
        let curDeviceOrientation = UIDevice.current.orientation
        let exifOrientation: CGImagePropertyOrientation
        
        switch curDeviceOrientation {
        case UIDeviceOrientation.portraitUpsideDown:  // Device oriented vertically, home button on the top
            exifOrientation = .left
        case UIDeviceOrientation.landscapeLeft:       // Device oriented horizontally, home button on the right
            exifOrientation = .upMirrored
        case UIDeviceOrientation.landscapeRight:      // Device oriented horizontally, home button on the left
            exifOrientation = .down
        case UIDeviceOrientation.portrait:            // Device oriented vertically, home button on the bottom
            exifOrientation = .up
        default:
            exifOrientation = .up
        }
        return exifOrientation
    }
}

protocol ActionCameraDelegate: NSObjectProtocol {
    func actionRecognized(of category: String)
}

struct ActionCameraControllerView: UIViewControllerRepresentable {
    
    
    public typealias UIViewControllerType = ActionCameraController
    
    @Binding var labelResult: String
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<ActionCameraControllerView>) -> ActionCameraController {
        var a = ActionCameraController()
        a.delegate = context.coordinator
        return a
//        return ActionCameraController(labelResult: $labelResult)
    }
    
    public func updateUIViewController(_ uiViewController: ActionCameraController, context: UIViewControllerRepresentableContext<ActionCameraControllerView>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, ActionCameraDelegate {
        
        let parent: ActionCameraControllerView
        
        init(_ parent: ActionCameraControllerView) {
            self.parent = parent
        }
        
        func actionRecognized(of category: String) {
            parent.labelResult = category
        }
    }
}
