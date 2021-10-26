//
//  NickNameView.swift
//  WordFit
//
//  Created by Mario Oliva on 23/10/21.
//
import SwiftUI

struct NickNameView: View {
    @State var newNickname = String.init()
    @State var placeHolder = "New Nickname"
    var body: some View {
        NavigationView{
        VStack{
            
            VStack{
            Image("logo")
                .resizable()
                .frame(width: 116, height: 116)
                Text("")
                    .frame(width: 30, height: 60, alignment: .center)
          Spacer()
            Text("Choose Your Nickname")
                .font(Font.custom("Lato",size: 33.33333333333336))
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .lineSpacing(0.68)
                
                Text("")
                    .frame(width: 30, height: 20, alignment: .center)
                
                Text("Your NickName is used for the WordFit Rankings System.\n\nUse at least 4 characters and maximum 8 characters.")
                    .frame(width: 299, height: 197)
                    .font(Font.custom("Lato",size: 23.33333333333332))
                    .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                    .lineSpacing(0.98)
            }
            Text("")
                .frame(width: 30, height: 40, alignment: .center)
            VStack{
                TextField(placeHolder,text: $newNickname,onEditingChanged: {edit in
                    
                },onCommit: {
                    appPreferences.setStringPreferences(forKey: "NickName", value: newNickname)
                    newNickname = ""
                    
                })
                    .font(Font.custom("Lato",size: 20))
                    .foregroundColor(Color.black)
                    .frame(width: 299, height: 60, alignment: .center)
                    .background(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                    .multilineTextAlignment(.center)
                    .lineSpacing(1.13)
            }
            Text("")
                .frame(width: 30, height: 5, alignment: .center)
            VStack{
                Button(action: {
                       print("ciao")
                      }) {
                          NavigationLink(destination: PlayView()){
                              Text("OK")
                              .font(Font.custom("Lato",size: 18))
                              .lineSpacing(0.30)
                              .frame(width: 311, height: 54, alignment: .center)
                              .foregroundColor(.white)
                              .background(Color.init(red: 0.87, green: 0.33, blue: 0.4))
                              .cornerRadius(8)
                           }.simultaneousGesture(TapGesture().onEnded{
                               appPreferences.setStringPreferences(forKey: "NickName", value: newNickname)
                               
                               newNickname = ""
                               
                           })
                           
                      }
                Text("")
                    .frame(width: 30, height: 50, alignment: .center)
                
                Text("WordFit")
                .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                .font(Font.custom("Mallory",size: 33.33333333333336))
                .lineSpacing(1.3)
                .padding()
                
                Text("")
                    .frame(width: 30, height: 60, alignment: .center)
                
                Spacer()
            }
        }
    }
    .navigationBarHidden(true)
}
}

struct NickNameView_Previews: PreviewProvider {
    static var previews: some View {
        NickNameView()
    }
}
