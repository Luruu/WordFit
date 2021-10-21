//
//  GameRulesView.swift
//  WordFit
//
//  Created by Salvo D'Amore on 21/10/21.
//

import SwiftUI

struct GameRulesView: View {
    var body: some View {
        VStack{
            Text("WordFit")
//                .font(.system(size: 66.67))
                .font(Font.custom("Mallory",size: 40))
                .tracking(3.5)
                .lineSpacing(1.67)
                .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                .frame(width: 221, height: 51,alignment: .center)
                .background(Color.white)
            Spacer()
            Text("Game Rules")
                .frame(width: 180, height: 32, alignment: .center)
                .font(Font.custom("Lato",size: 27))
                .lineSpacing(1.29)
                .foregroundColor(Color.init(red: 0.87, green: 0.33, blue: 0.4))
                .padding()
            Text("The goal of the game is to guess words over a certain period of time from hints. After guessing the word, the player will have to do a physical activity (Jumping Jacks) to move on to the next word.\n\nEach word adds increases to the player's score. The players will be in a ranking by score. The fastest players will be on the leaderboard for speed.")
                .frame(width: 312, height: 450, alignment: .center)
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .font(Font.custom("Lato",size: 25))
                .lineSpacing(1)
            Spacer()
            Image("logo")
                .resizable()
                .frame(width: 96, height: 95, alignment: .center)
            Spacer()
        }
    }
}

struct GameRulesView_Previews: PreviewProvider {
    static var previews: some View {
        GameRulesView()
    }
}
