//
//  HomePageView.swift
//  WordFit
//
//  Created by Salvo D'Amore on 21/10/21.
//

import SwiftUI

struct HomePageView: View {
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
                Text("Nickname")
                    .font(Font.custom("Lato",size: 13.33333333333334))
                    .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                    .lineSpacing(0.55)
                Text("Score: ?, Trophies: ?")
                    .font(Font.custom("Lato",size: 13.33333333333334))
                    .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                    .lineSpacing(0.55)
                }
                .multilineTextAlignment(.center)
                
            }
        
            VStack(alignment: .center){
                Button(action: {
                    print("Play Tapped!")
                }) {
                        Text("PLAY")
                        .font(Font.custom("Lato",size: 18))
                        .lineSpacing(0.3)
                        .frame(width: 311, height: 54, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.init(red: 0.87, green: 0.33, blue: 0.4))
                        .cornerRadius(8)
                    }
                .padding()
                HStack{
                    Button(action: {
    //                    print("Ranking Tapped!")
                        
                    }) {
                        NavigationLink(destination: RakingView() ){
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
                    print("Games Rules Tapped!")
                }) {
                    NavigationLink(destination: GameRulesView()){
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
                HStack{
                    Button(action: {
                        print("Settings Tapped!")
                    }) {
                            Text("Settings")
                            .font(Font.custom("Roboto",size: 20))
                            .lineSpacing(0.3)
                            .frame(width: 142, height: 58)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                            .cornerRadius(4)
                        }
                    Button(action: {
                        print("My Trophies Tapped!")
                    }) {
                            Text("My Trophies")
                            .font(Font.custom("Roboto",size: 20))
                            .lineSpacing(0.3)
                            .frame(width: 142, height: 58,alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                            .cornerRadius(4)
                        }
                }
                Button(action: {
                    print("Warnings Tapped!")
                }) {
                    NavigationLink(destination: WarningsView()){
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
    }
}
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
