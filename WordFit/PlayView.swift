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

    
    @State var ShowPopUp : Bool = false

    @State var isSet : Bool = false

    init(){session = nil
        wordProposed = Word(value: "", score: 0, suggestion: "")
    }
    
    func start_Game(){
        let person : User = User(name: appPreferences.getStringPreferences(forKey: "NickName") ?? "NickName")
        session = gameSession(player : person)
        wordProposed = (session?.getWord()!)!
    }
    
    func submit_answer() -> Bool{
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
            return true
        }else{
            print("Errato")
            user_solution = ""
            borderColor = Color.red
            wrong = true
            _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: {_ in
                wrong = false
                borderColor = Color.white
            })
            return false
        }
    }
    
    var body: some View {
        
        NavigationView{
        
        ZStack{
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
                .minimumScaleFactor(0.5)
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
                      }
                  
                
                Text("")
                    .frame(width: 30, height: 20, alignment: .center)
                
                HStack{
                    Button(action: {
                        self.ShowPopUp = true
                    }) {                            Text("Quit")
                            .font(Font.custom("Lato",size: 20))
                            .lineSpacing(0.27)
                            .frame(width: 136, height: 74)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                            .cornerRadius(8)
                    }

                    Button(action: {
                        isSet = true
                    }){
                        Text("Go Next \n-5 points!")
                            .font(Font.custom("Lato",size: 20))
                            .lineSpacing(0.27)
                            .frame(width: 136, height: 74,alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                            .cornerRadius(8)
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
            
            if ShowPopUp{
               PlayView().blur(radius: 5)
                
                
                VStack{
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
                 Button(action: {
 //                    print("Games Rules Tapped!")
                     SoundMangager.instance.PlaySoundButton()
                 }) {
                     NavigationLink(destination: HomePageView().onAppear{
                         SoundMangager.instance.PlaySoundButton()
                     }){
                         Text("YES")
                         .font(Font.custom("Roboto",size: 27))
                         .lineSpacing(0.3)
                         .frame(width: 142, height: 70,alignment: .center)
                         .foregroundColor(.white)
                         .background(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                         .cornerRadius(9)
                     }
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

