//
//  PlayView.swift
//  WordFit
//
//  Created by Mario Oliva on 23/10/21.
//

import SwiftUI

struct PlayView: View {
    @State var timeRemaningMin = 2
    @State var timeRemaningSec = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var repeats : Bool = true
    @State var timerExpired : Bool = false
    @State var wordProposed : Word
    @State var user_solution :  String = ""
    @State var session_point : Int = 0
    @State var session : gameSession?
    @State var borderColor : Color = Color.white
    @State var wrong : Bool = false
    @State var wrongMsg : Bool = false
    @State var correct : Bool = false
    @State var correctMsg : Bool = false
    @State var ShowPopUp : Bool = false
    @State var isSet : Bool = false
    @State var notPoints : Bool = false
    @State var malusAnswer : Int = 0
    @State var quit : Bool = false
    @State var nFind : Int = 0
    @State var win : Bool = false
    @State var msgString : String = ""
    @State var haveWin : Bool = false//flag to see the nav link to come back to home
    @State var msgColor : Color = Color.red
    let malus : Int = 5
    init(){
        session = nil
        wordProposed = Word(value: "", score: 0, suggestion: "")
    }

    func calculateMalus(){
        if session_point - malus >= 0{
            session_point = session_point - malus
        }
        else{
            session_point = 0
        }
    }
    
    func goNext(){
        wordProposed = (session?.getWord())!
        user_solution=""
    }
    
    func start_Game(){
        let person : User = User(name: appPreferences.getStringPreferences(forKey: "NickName") ?? "NickName")
        session = gameSession(player : person)
        wordProposed = (session?.getWord()!)!
    }
    
    //Return true when user has find 2 word soo the game end
    //return false when not have completed the game but has just find a word.
    func hasWin()->Bool{
        if nFind == 2{
            session?.endGame(score: session_point, quit: false)
            appPreferences.setIntPreferences(forKey: "nFind", value: 0)
            haveWin = true
            return true
        }
        else{
            goNext()
            return false
        }
    }
    
    /*
     this function have to return false when the answer it's wrong and false ONLY when user
     find the correct word but not find the second. In the case of second hasWin shows
     a msg that notify the win and actives the NavigationLink to go to home.
     */
    func submit_answer() -> Bool{
        var retval : Bool = false
        if (session?.checkSolution(word1: user_solution, word2: wordProposed.getValue()))!{
            session_point += wordProposed.getScore()
            correctMsg = true
            user_solution = ""
            msgString = (nFind==1) ? "You won, your new score is \(appPreferences.getIntPreferences(forKey: "Score") + session_point)" :
           "Correct answer: +\(wordProposed.getScore()) points"
            borderColor = Color.green
            msgColor = Color.green
            _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: {_ in
                correctMsg = false
                nFind+=1
                retval = !hasWin()
            })
            appPreferences.setIntPreferences(forKey: "nFind", value: nFind)
            return retval
        }else{
            user_solution = ""
            borderColor = Color.red
            if(session_point > 0){
                malusAnswer = 1
                session_point = session_point - malusAnswer
            }
            wrongMsg = true
            msgString = "Wrong answer -\(malusAnswer) points"
            msgColor = Color.red
            borderColor = Color.white
            _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: {_ in
                wrongMsg = false
                wrong = true
            })
            return false
        }
    }
    
    var body: some View {
        
        NavigationView{
        
        ZStack{
        VStack{
            NavigationLink("",destination : HomePageView(), isActive: $quit)
            Image("logo")
                .resizable()
                .frame(width: 90, height: 90)
            
//            Text("")
//                .frame(width: 30, height: 10, alignment: .center)
            
            Text("\(timeRemaningMin) : \(timeRemaningSec)")
                .onReceive(timer){ _ in
                    if timeRemaningMin >= 0 && timeRemaningSec != 0 {
                        timeRemaningSec -= 1
                        if timeRemaningSec == 0 && timeRemaningMin != 0{
                            timeRemaningMin -= 1
                            timeRemaningSec = 60
                        }
                        else if timeRemaningMin == 0 && timeRemaningSec == 0{
                            msgString = "Timer expired, Game Over"
                            msgColor = Color.red
                            timerExpired = true
                            _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in
                                quit = true
                            })
                            session?.endGame(score: 0, quit: true)
                        }
                    }
                }
            
            Text(wordProposed.getSuggestion())
                .font(Font.custom("Lato",size: 33.33333333333336))
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .lineSpacing(0.68)
                .frame(width: 350, height: 100)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
           
            
            if notPoints || correctMsg || wrongMsg || timerExpired{
                Text(msgString)
                    .font(Font.custom("Lato", size: 25))
                    .foregroundColor(msgColor)
                    .lineSpacing(0.68)
                    .multilineTextAlignment(.center)
            }
            
            NavigationLink("",destination: HomePageView(), isActive: $haveWin )
            VStack{
            TextField("Solution",text: $user_solution, onEditingChanged: {edit in
            },onCommit: {
                isSet = submit_answer()
            })
                .font(Font.custom("Lato",size: 20))
                .foregroundColor(Color.black)
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                .multilineTextAlignment(.center)
                .lineSpacing(0.27)
                .cornerRadius(1.67)
                .onAppear(perform: {
                        start_Game()
                })
                .border(borderColor)
            }
            
            Text("")
                .frame(width: 30, height: 15, alignment: .center)
            
            
            VStack{
                //isActive = navigation per risposta esatta.
                NavigationLink("", destination: GameActivityView(), isActive: $isSet)
            Button(action: {
                      isSet = submit_answer()
                  }){
                          Text("OK")
                          .font(Font.custom("Lato",size: 18))
                          .lineSpacing(0.30)
                          .frame(width: 311, height: 54, alignment: .center)
                          .foregroundColor(.white)
                          .background(Color.init(red: 0.87, green: 0.33, blue: 0.4))
                          .cornerRadius(8)
                          .padding()
                      }
                  
                
               
                HStack{
                    Button(action: {
                        WordList.getIstance().resetValue()
                        self.ShowPopUp = true
                    }){
                        Text("Quit")
                            .font(Font.custom("Lato",size: 20))
                            .lineSpacing(0.27)
                            .frame(width: 136, height: 74)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                            .cornerRadius(8)
                    }

                    Button(action: {
                        if session_point==0{
                            notPoints = true
                            msgString = "You can't go next. \nAt least 1 point is required"
                            msgColor = Color.orange
                            _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: {_ in
                                notPoints = false
                            })
                            
                        }else{
                            calculateMalus()
                            goNext()
                        }
                    }){
                        Text("Go Next -\(malus) points!")
                            .font(Font.custom("Lato",size: 20))
                            .lineSpacing(0.27)
                            .frame(width: 136, height: 74,alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                            .cornerRadius(8)
                        }

                }
                
                
                Text("Actual Points : \(session_point)")
                    .font(Font.custom("Lato",size: 20))
                    .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                    .lineSpacing(1.13)
                    .padding()
            
            }
            

            Text("WordFit")
            .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
            .font(Font.custom("Mallory",size: 33.33333333333336))
            .lineSpacing(1.3)
            .padding(.top, 40.0)


        }
            
            if ShowPopUp{
               PlayView().blur(radius: 5)
                VStack{
                    NavigationLink("",destination : HomePageView(), isActive: $quit)
                Text("Are you sure?")
                        .font(Font.custom("Lato",size: 49))
                        .lineSpacing(0.5)
                        .foregroundColor(.white)
                        .padding(5)
                    
                    Text("The level will be lost")
                            .font(Font.custom("Lato",size: 25))
                            .lineSpacing(0.5)
                            .foregroundColor(.white)
                    
                    Text("")
                        .frame(width: 30, height: 50, alignment: .center)
             HStack{
                 Button(action: {                     SoundMangager.instance.PlaySoundButton()
                     quit = true
                     session?.endGame(score: 0, quit: true)
                 }){
                         Text("YES")
                         .font(Font.custom("Roboto",size: 27))
                         .lineSpacing(0.3)
                         .frame(width: 142, height: 70,alignment: .center)
                         .foregroundColor(.white)
                         .background(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                         .cornerRadius(9)
                     }
                 

                                 Button(action: {
                                     self.ShowPopUp = false
                                     SoundMangager.instance.PlaySoundButton()
                                 }) {
                                 
                                         Text("NO")
                                         .font(Font.custom("Roboto",size: 27))
                                         .lineSpacing(0.3)
                                         .frame(width: 142, height: 70)
                                         .foregroundColor(.white)
                                         .background(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                                         .cornerRadius(9)
                                     }
                 
                    }
             }
                .frame(width: 360, height: 460)
                .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .cornerRadius(29)
            }
    }
}
        .navigationBarHidden(true)
}
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}

