//
//  ContentView.swift
//  WordFit
//
//  Created by Renato on 20/10/21.
//

import SwiftUI

struct WelcomePageView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("WordFit")
    //                .font(.system(size: 66.67))
                    .font(Font.custom("Mallory",size: 66.666666666666667))
                    .tracking(3.5)
                    .lineSpacing(1.67)
                    .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                    .frame(width: 291, height: 92,alignment: .leading)
                    .background(Color.white)
                .padding(.leading, CGFloat(20))
                .padding()
                Text("Welcome to the \n WordFit Game")
                    .font(Font.custom("Mallory",size: 26))
                    .lineSpacing(1.29)
                    .foregroundColor(Color.init(red: 0.87, green: 0.33, blue: 0.4))
                    .multilineTextAlignment(.center)
                    .padding(50)
                VStack(alignment: .trailing){
                    Text("Guess more words, be the fastest and be the best! \n")
                    Text("Play and have fun with your friends with our challenges!")
                }
                .font(Font.custom("Mallory",size: 20))
                .frame(width: 291, height: 147, alignment: .center)
                .lineSpacing(1.3)
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .multilineTextAlignment(.center)
                .padding(20)
                    ZStack{
                        Button(action: {
                        }) {
                            NavigationLink(destination: HomePageView()){
                                Image("circlebutton")
                                .resizable()
                                .frame(width: 110, height: 116)
                                }
                            .simultaneousGesture(TapGesture().onEnded{
                                appPreferences.setBoolPreferences(forKey: "FirstLogin", value: false)
                            })
                            }
                            Text("OK")
                                .font(Font.custom("Mallory",size: 20))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        
                    }
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 76, height: 75, alignment: .center)
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
