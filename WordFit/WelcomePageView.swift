//
//  ContentView.swift
//  WordFit
//
//  Created by Renato on 20/10/21.
//

import SwiftUI

struct WelcomePageView: View {
    var body: some View {
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
//           Spacer()
/*            Button(action: {
                print("Share tapped!")
            }) {
                    Text("Select your nickname")
                        .font(.system(size: 17))
                        .foregroundColor(.init(red: 0.51, green: 0.56, blue: 0.65))
                        .frame(width: 357.0, height: 36.0)
                        .background(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                        .cornerRadius(10)
                }
            .padding()
 */
            .padding(20)
            ZStack{
            Button(action: {
                print("OK Tappet")
            }) {
                    Image("circlebutton")
                    .resizable()
                    .frame(width: 110, height: 116)
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
