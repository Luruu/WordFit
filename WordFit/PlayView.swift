//
//  PlayView.swift
//  WordFit
//
//  Created by Mario Oliva on 23/10/21.
//

import SwiftUI

struct PlayView: View {
    @State var wordProposed : Word
    @State var user_solution :  String = ""
    @State var session_point : Int = 0
    @State var session : gameSession?
    @State var borderColor : Color = Color.white
    @State var wrong : Bool = false
    @State var correct : Bool = false
    init(){session = nil
        wordProposed = Word(value: "", score: 0, suggestion: "")
    }
    
    func start_Game(){
        let person : User = User(name: appPreferences.getStringPreferences(forKey: "NickName") ?? "NickName")
        session = gameSession(player : person)
        wordProposed = (session?.getWord()!)!
    }
    
    func submit_answer(){
        if (session?.checkSolution(word1: user_solution, word2: wordProposed.getValue()))!{
            print("Esatto")
            session_point += wordProposed.getScore()
            correct = true
            borderColor = Color.green
            //Andare nella view dei JJ
            _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: {_ in
                correct = false
                borderColor = Color.green
            })
        }else{
            print("Errato")
            user_solution = ""
            //Evidenziare di rosso il text field?
            borderColor = Color.red
            wrong = true
            _ = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: {_ in
                wrong = false
                borderColor = Color.white
            })
        }
    }
    
    
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 116, height: 116)
            
            Text("")
                .frame(width: 30, height: 10, alignment: .center)
            
            Text(wordProposed.getSuggestion())
                .font(Font.custom("Lato",size: 33.33333333333336))
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .lineSpacing(0.68)
                .frame(width: 350, height: 200)
                .multilineTextAlignment(.center)
            if wrong{
                Text("Wrong answer")
                     .font(Font.custom("Lato",size: 25))
                     .foregroundColor(Color.red)
                     .lineSpacing(0.68)
                     .multilineTextAlignment(.center)
            }
           
            if correct{
                Text("Correct answer")
                     .font(Font.custom("Lato",size: 25))
                     .foregroundColor(Color.green)
                     .lineSpacing(0.68)
                     .multilineTextAlignment(.center)
            }
            
            VStack{
            TextField("Solution",text: $user_solution, onEditingChanged: {edit in
                
            },onCommit: {
                submit_answer()
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
            Button(action: {
                      print("Play Tapped!")
                  }) {
                      NavigationLink(destination: GameActivityView()){
                          Text("OK")
                          .font(Font.custom("Lato",size: 18))
                          .lineSpacing(0.30)
                          .frame(width: 311, height: 54, alignment: .center)
                          .foregroundColor(.white)
                          .background(Color.init(red: 0.87, green: 0.33, blue: 0.4))
                          .cornerRadius(8)
                      }
                  }
                
                Text("")
                    .frame(width: 30, height: 20, alignment: .center)
                
                HStack{
                    Button(action: {
                        //print("Share Tapped!")
                    }) {
                        NavigationLink(destination: SettingsView()){
                            Text("QUIT")
                            .font(Font.custom("Lato",size: 20))
                            .lineSpacing(0.27)
                            .frame(width: 136, height: 74)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                            .cornerRadius(8)
                        }
                    }
                    Button(action: {
                        session_point-=5
                    }) {
                        NavigationLink(destination: MyTrophiesView()){
                            Text("Go Next \n-5 points!")
                            .font(Font.custom("Lato",size: 20))
                            .lineSpacing(0.27)
                            .frame(width: 136, height: 74,alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                            .cornerRadius(8)
                        }
                    }
                }
                
                Text("")
                    .frame(width: 30, height: 15, alignment: .center)
                
                Text("Actual Points : \(session_point)")
                    .font(Font.custom("Lato",size: 20))
                    .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                    .lineSpacing(1.13)
            
            }
            
            Text("")
                .frame(width: 30, height: 30, alignment: .center)
            
            Text("WordFit")
            .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
            .font(Font.custom("Mallory",size: 33.33333333333336))
            .lineSpacing(1.3)
            .padding(2)
            
            
            
        }
        .navigationBarHidden(true)
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}

