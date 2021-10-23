//
//  NickNameView.swift
//  WordFit
//
//  Created by Mario Oliva on 23/10/21.
//

import SwiftUI

struct NickNameView: View {
    @State var newNickname = ""
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 116, height: 116)
                .padding(60)
            
            Text("Choose Your NickName")
                .font(Font.custom("Lato",size: 33.33333333333336))
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .lineSpacing(0.68)
            
            VStack{
                Text("Your NickName is used for the WordFit Rankings system.\n\nThe NickName must be a minimum of 4 and a maximum of 8 in length.  ")
                    .font(Font.custom("Lato",size: 23.33333333333332))
                    .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                    .lineSpacing(0.98)
            }
            VStack{
                TextField("New Nickname",text: $newNickname,onEditingChanged: {edit in
                    
                },onCommit: {
                    
                })
                    .font(Font.custom("Lato",size: 20))
                    .foregroundColor(Color.black)
                    .frame(width: 299, height: 60, alignment: .center)
                    .background(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                    .multilineTextAlignment(.center)
                    .lineSpacing(1.13)
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
            }
            
            Text("WordFit")
            .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
            .font(Font.custom("Mallory",size: 33.33333333333336))
            .lineSpacing(1.3)
            .padding()
        }
    }
}

struct NickNameView_Previews: PreviewProvider {
    static var previews: some View {
        NickNameView()
    }
}
