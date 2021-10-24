//
//  PlayView.swift
//  WordFit
//
//  Created by Mario Oliva on 23/10/21.
//

import SwiftUI

struct PlayView: View {
    @State var Solution = String()
    @State var suggestion = String()
    var session : gameSession
    
    init(){
        let person : User = User(name: appPreferences.getStringPreferences(forKey: "NickName") ?? "NickName")
        session = gameSession(player : person)
        suggestion = (session.getWord()?.getSuggestion())!
        Solution = (session.getWord()?.getValue())!
        print("PlayView20: solution ", Solution)
        print("PlayView21: suggestion ",suggestion)
    }
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 116, height: 116)
            
            Text("")
                .frame(width: 30, height: 10, alignment: .center)
            
            Text(suggestion)
                .font(Font.custom("Lato",size: 33.33333333333336))
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .lineSpacing(0.68)
                .frame(width: 350, height: 200)
                .multilineTextAlignment(.center)
            
           
            
            //Inserimento soluzione
            VStack{
            TextField("Solution",text: $Solution, onEditingChanged: {edit in
                
            },onCommit: {
                
            })
                .font(Font.custom("Lato",size: 20))
                .foregroundColor(Color.black)
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                .multilineTextAlignment(.center)
                .lineSpacing(0.27)
                .cornerRadius(1.67)
            }
            
            Text("")
                .frame(width: 30, height: 15, alignment: .center)
            
            VStack{
            Button(action: {
                      //print("Play Tapped!")
                  }) {
                      NavigationLink(destination: PlayView()){
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
                            Text("Share")
                            .font(Font.custom("Lato",size: 20))
                            .lineSpacing(0.27)
                            .frame(width: 136, height: 74)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                            .cornerRadius(8)
                        }
                    }
                    Button(action: {
                        //print("Gonext Tapped!")
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
                
                // Sostituire N con il punteggio dell'utente e k con il punteggio dell'attuale livello
                Text("Actual Points : N + K")
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
