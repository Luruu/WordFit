//
//  HomePageView.swift
//  WordFit
//
//  Created by Salvo D'Amore on 21/10/21.
//

import SwiftUI


struct HomePageView: View {
   
    @State var ShowPopUp : Bool = false
    var testo = SoundMangager()
    @State var nickName = "No nickname"
    @State var Score = 0
    @State var setNick : Bool = false
    @State var appear : Bool = false
   
    var body: some View {
        NavigationView{
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 116, height: 116)
                .padding(60)
                .onAppear{
                    UserDefaults.standard.setValue(0, forKey: "rep")
                    UserDefaults.standard.setValue(2, forKey: "timeRemaningMin")
                    UserDefaults.standard.setValue(60, forKey: "timeRemaningSec")
                    UserDefaults.standard.setValue(0, forKey: "session_point")
                    UserDefaults.standard.setValue(0, forKey: "nFind")
                }
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
                    
                    NavigationLink("",destination: NickNameView(), isActive: $setNick)
                    Text("Score: \(self.Score)")
                
                        .onAppear{
                                Score = appPreferences.getIntPreferences(forKey: "Score")

                                /* if Score>0{
                                     if nickName == "No nickname"{
                                         
                                        print("Devi inserire il nick")
                                         
                                     }else{ //Score > 0 ma il nick gia esiste
                                         print("entro in score >0 ma nick esistente ed è : \(nickName)")
                                         let kit = DictParthKit.getIstance()
                                         
                                         kit.updateRanking(key: nickName, value: String(Score))
                                         print("setNick: ", setNick)

                                     }
                                 }*/
                            
                            
                           /* Score = appPreferences.getIntPreferences(forKey: "Score")

                            if Score>0{
                                if nickName == "No nickname"{
                                        setNick = true
                                        print("Devi inserire il nick")
                                    
                                }else{ //Score > 0 ma il nick gia esiste
                                    setNick = false
                                    print("entro in score >0 ma nick esistente ed è : \(nickName)")
                                    let kit = DictParthKit.getIstance()
                                    
                                    kit.updateRanking(key: nickName, value: String(Score))
                                    print(setNick)
                                }
                            }*/
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
                        NavigationLink(destination: RankingView().onAppear{
                            SoundMangager.instance.PlaySoundButton()
                        })
                        {
                            Text("Ranking")
                            .font(Font.custom("Roboto",size: 20))
                            .lineSpacing(0.3)
                            .frame(width: 298, height: 54, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                            .cornerRadius(8)
                        }
                        
                    }
                   // .padding(.trailing,5)
                    
                    
                }
                .padding(.bottom,5)
                
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
                    .padding(.trailing,5)
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
