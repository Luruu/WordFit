//
//  PlayView.swift
//  WordFit
//
//  Created by Mario Oliva on 23/10/21.
//

import SwiftUI

struct PlayView: View {
    @State var Solution = ""
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 116, height: 116)
                .padding(60)
            
            Text("Inserire Suggerimento")
                .font(Font.custom("Lato",size: 33.33333333333336))
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .lineSpacing(0.68)
            
            //Inserimento soluzione
            VStack{
            TextField("New Nickname",text: $Solution, onEditingChanged: {edit in
                
            },onCommit: {
                
            })
                .font(Font.custom("Lato",size: 20))
                .foregroundColor(Color.black)
                .frame(width:  UIScreen.main.bounds.size.width - 185, height: 33, alignment: .center)
                .background(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                .multilineTextAlignment(.center)
                .lineSpacing(0.27)
                .cornerRadius(1.67)
            }
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
                
                // Sostituire N con il punteggio dell'utente e k con il punteggio dell'attuale livello
                Text("Actual Points : N + K")
                    .font(Font.custom("Lato",size: 20))
                    .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                    .lineSpacing(1.13)
            
            }
            
            Text("WordFit")
            .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
            .font(Font.custom("Mallory",size: 33.33333333333336))
            .lineSpacing(1.3)
            .padding()
            
            
            
        }
        .navigationBarHidden(true)
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
