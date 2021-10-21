//
//  HomePageView.swift
//  WordFit
//
//  Created by Salvo D'Amore on 21/10/21.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 116, height: 116, alignment: .center)
                .padding()
            VStack{
            ZStack{
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 92, height: 92, alignment: .center)
                .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                Image("face")
                    .resizable()
                    .frame(width: 44, height: 18, alignment: .center)
//                Secondo Salvatore, Mario e vittorio, non si è mai visto un gioco in cui uno insersci la propria fotografia, quindi rimaniamo questo smile uguale a tutti o facciamo che l'untete sceglie una serie di avatr.
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
            }
        }
    }

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
