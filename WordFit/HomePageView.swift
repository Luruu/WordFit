//
//  HomePageView.swift
//  WordFit
//
//  Created by Salvo D'Amore on 21/10/21.
//

import SwiftUI
import AVKit

struct HomePageView: View {
    
    
    @State var ShowPopUp : Bool = false
    var testo = SoundMangager()
    @State var nickName = String.init()
    @State var Score = String.init()
    var tropies : [Int] = appPreferences.getIntArrayPreferences(forKey: "Tropies") as! [Int]
    var body: some View {
        NavigationView{
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 116, height: 116)
                .padding(60)
            VStack{
            ZStack{
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 92, height: 92, alignment: .center)
                .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                Image("face")
                    .resizable()
                    .frame(width: 44, height: 18, alignment: .center)
            }
                VStack{
                    Button(action: {
                    }) {
                        NavigationLink(destination: SettingsView()){
                            Text(" \(self.nickName)")
                                .onAppear {
                                    nickName = appPreferences.getStringPreferences(forKey: "NickName") ?? "No nickname"
                                        }
                                .font(Font.custom("Lato",size: 13.33333333333334))
                                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                                .lineSpacing(0.55)
                         }
                    }
                    
                    Text("Score: \(self.Score) Trophies: \(tropies.count)" )
                        .onAppear{
                            Score = appPreferences.getStringPreferences(forKey: "Score") ?? "No nickname"
                           
                        }
                    .font(Font.custom("Lato",size: 13.33333333333334))
                    .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                    .lineSpacing(0.55)
                }
                .multilineTextAlignment(.center)
                
            }
        
            VStack(alignment: .center){
                Button(action: {
                    print("Play Tapped!")
                    SoundMangager.instance.PlaySoundButton()
                }) {
                    NavigationLink(destination: PlayView() .onAppear{
                        SoundMangager.instance.PlaySoundButton()
                    }){
                        Text("PLAY")
                        .font(Font.custom("Lato",size: 18))
                        .lineSpacing(0.3)
                        .frame(width: 311, height: 54, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.init(red: 0.87, green: 0.33, blue: 0.4))
                        .cornerRadius(8)
                     }
                }
                .padding()
                HStack{
                    Button(action: {
                      print("Ranking Tapped!")
                        
                    }) {
                        NavigationLink(destination: RakingView().onAppear{
                            SoundMangager.instance.PlaySoundButton()
                        })
                        {
                            Text("Ranking")
                            .font(Font.custom("Roboto",size: 20))
                            .lineSpacing(0.3)
                            .frame(width: 142, height: 58)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                            .cornerRadius(4)
                        }
                        
                    }
                    Button(action: {
//                        print("My Trophies Tapped!")
                        SoundMangager.instance.PlaySoundButton()
                    }) {
                        NavigationLink(destination: MyTrophiesView().onAppear{
                            SoundMangager.instance.PlaySoundButton()
                        }){
                            Text("My Trophies")
                            .font(Font.custom("Roboto",size: 20))
                            .lineSpacing(0.3)
                            .frame(width: 142, height: 58,alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                            .cornerRadius(4)
                        }
                    }
                    
                }
                HStack{
                    Button(action: {
//                        print("Settings Tapped!")
                        SoundMangager.instance.PlaySoundButton()
                    }) {
                        NavigationLink(destination: SettingsView().onAppear{
                            SoundMangager.instance.PlaySoundButton()
                        }){
                            Text("Settings")
                            .font(Font.custom("Roboto",size: 20))
                            .lineSpacing(0.3)
                            .frame(width: 142, height: 58)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                            .cornerRadius(4)
                        }
                    }
                    Button(action: {
    //                    print("Games Rules Tapped!")
                        SoundMangager.instance.PlaySoundButton()
                    }) {
                        NavigationLink(destination: GameRulesView().onAppear{
                            SoundMangager.instance.PlaySoundButton()
                        }){
                            Text("Games Rules")
                            .font(Font.custom("Roboto",size: 20))
                            .lineSpacing(0.3)
                            .frame(width: 142, height: 58,alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                            .cornerRadius(4)
                        }
                    }
                }
            
                Button(action: {
//                    print("Warnings Tapped!")
                    SoundMangager.instance.PlaySoundButton()
                }) {
                    NavigationLink(destination: WarningsView().onAppear{
                        SoundMangager.instance.PlaySoundButton()
                    }){
                        Text("WARNINGS")
                        .font(Font.custom("Lato",size: 18))
                        .lineSpacing(0.3)
                        .frame(width: 311, height: 54, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                        .cornerRadius(8)
                    }
                }
               .padding()
                }
                Text("WordFit")
                .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                .font(Font.custom("Mallory",size: 33.33333333333336))
                .lineSpacing(1.3)
                .padding(110)
            }
        }
        .navigationBarHidden(true)
        .accentColor(Color.init(red: 0.51, green: 0.56, blue: 0.65))
    }
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
