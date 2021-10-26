//
//  Audio.swift
//  WordFit
//
//  Created by Mario Oliva on 25/10/21.
//
import SwiftUI
import Foundation
import AVKit


class SoundMangager {
    
    
    static let instance = SoundMangager()
    
    var player : AVAudioPlayer?
    
    func PlaySoundToggle() {
        guard let url = Bundle.main.url(forResource: "ToggleSound", withExtension: ".wav") else {return}
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("error play Sound. \(error.localizedDescription)")
      }
    }
    func PlaySoundButton() {
        guard let url = Bundle.main.url(forResource: "ButtonSound", withExtension: ".aiff") else {return} 
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("error play Sound. \(error.localizedDescription)")
      }
    }
    
    func PlaySoundError() {
        guard let url = Bundle.main.url(forResource: "ErrorSound", withExtension: ".wav") else {return}
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("error play Sound. \(error.localizedDescription)")
      }
    }
}

