//
//  SettingsView.swift
//  WordFit
//
//  Created by Salvo D'Amore on 22/10/21.
//

import SwiftUI
import AVKit

struct SettingsView: View {
    @State private var showAudio = false
//   @State private var showDarkMode = false
    var test = SoundMangager()

    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    @State var newNickname = String()
    @State var placeHolder = "New Nickname"
    
    
    var body: some View {
        
        
        VStack{
        VStack{
            Text("App Settings")
            .frame(width: 287, height: 36, alignment: .center)
            .foregroundColor(Color.init(red: 0.87, green: 0.33, blue: 0.4))
            .font(Font.custom("Lato",size: 30))
            .lineSpacing(1)
            
            HStack{
                Text("DarkMode")
                    .frame(width: 180, height: 32,alignment: .leading)
                    .foregroundColor(Color.init(red: 0.51, green: 0.56, blue: 0.65))
                    .font(Font.custom("Lato",size: 27))
                    .lineSpacing(0.55)
                Toggle("", isOn: $isDarkMode)
                .toggleStyle(SwitchToggleStyle(tint: .init(red: 0.87, green: 0.33, blue: 0.4)))
                    .frame(width: 150, height: 32)
                    .onChange(of: isDarkMode){ value in
                        SoundMangager.instance.PlaySoundToggle()
                    }
//                 if isDarkMode {
//               }
            }
                HStack{
   /*             Text("Audio")
                    .frame(width: 180, height: 32,alignment: .leading)
                    .foregroundColor(Color.init(red: 0.51, green: 0.56, blue: 0.65))
                    .font(Font.custom("Lato",size: 27))
                    .lineSpacing(0.55)
            
                        Toggle("", isOn: $showAudio)
                        .toggleStyle(SwitchToggleStyle(tint: .init(red: 0.87, green: 0.33, blue: 0.4)))
                            .frame(width: 150, height: 32)
                        if !showAudio {
//                            qui va l'azione
    
                        }
    */
           }
        }
            Text("")
                .frame(width: 30, height: 60, alignment: .center)
            VStack{
                Text("Account Settings")
                    .frame(width: 236, height: 37,alignment: .center)
                    .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                    .font(Font.custom("Lato",size: 30))
                    .lineSpacing(0.75)
                Text("Change Nickname")
                    .frame(width: 223, height: 36,alignment: .center)
                    .foregroundColor(Color.init(red: 0.51, green: 0.56, blue: 0.65))
                    .font(Font.custom("Lato",size: 26))
                    .lineSpacing(0.55)
                    .padding(5)
                HStack{
                    TextField(placeHolder,text: $newNickname,onEditingChanged: {edit in
                        
                    },onCommit: {
                        appPreferences.setStringPreferences(forKey: "NickName", value: newNickname)
                        newNickname = ""
                    })
                        
                        .font(Font.custom("Lato",size: 20))
                        .frame(width:  UIScreen.main.bounds.size.width - 185, height: 33, alignment: .center)
                        .foregroundColor(Color.init(red: 0.51, green: 0.56, blue: 0.65))
                        .background(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                        .multilineTextAlignment(.center)
                        .lineSpacing(0.27)
                        .cornerRadius(1.67)
                    Button(action: {
                        appPreferences.setStringPreferences(forKey: "NickName", value: newNickname)
                        newNickname = ""
                        SoundMangager.instance.PlaySoundButton()
                    }) {
                            Text("Change")
                            .font(Font.custom("Roboto",size: 20))
                            .lineSpacing(0.26)
                            .frame(width: 122, height: 34,alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                            .cornerRadius(5.33)
                        }
                }
                .padding()
            }
            Text("")
                .frame(width: 30, height: 70, alignment: .center)
            VStack{
                Button(action: {
                    SoundMangager.instance.PlaySoundButton()
                    appPreferences.clearList()
                }) {
                        Text("Reset your progress")
                        .font(Font.custom("Roboto",size: 20))
                        .lineSpacing(0.3)
                        .frame(width: 323, height: 49, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                        .cornerRadius(4)
                    }
                Text("")
                    .frame(width: 30, height: 30, alignment: .center)
                Button(action: {
                    print("Credits Tapped!")
                    SoundMangager.instance.PlaySoundButton()
                }) {
                    NavigationLink(destination: CreditsView() .onAppear{
                        SoundMangager.instance.PlaySoundButton()
                    }){
                        Text("Credits")
                        .font(Font.custom("Lato",size: 18))
                        .lineSpacing(0.29)
                        .frame(width: 321, height: 42, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.init(red: 0.87, green: 0.33, blue: 0.4))
                        .cornerRadius(8)
                }
                    }
            }
            Text("")
                .frame(width: 30, height: 30, alignment: .center)
            Image("logo")
                .resizable()
                .frame(width: 96, height: 95, alignment: .center)
        }
        

}
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
