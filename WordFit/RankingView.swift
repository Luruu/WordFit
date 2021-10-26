//
//  RakingView.swift
//  WordFit
//
//  Created by Salvo D'Amore on 21/10/21.
//

import SwiftUI

struct RankingView: View {
    @State var kit = DictParthKit.getIstance()
    func showRanking() -> Bool {
        let res = kit.read(tag_: "Score", key_: "1")
        print("sorta", res)
        return true
    }
    
    
    var body: some View {
        VStack{
            
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
                .font(Font.custom("Mallory Mediudm",size: 13.33333333333334))
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .lineSpacing(0.55)
            Text("Score: ?, Trophies: ?")
                .font(Font.custom("Lato",size: 13.33333333333334))
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .lineSpacing(0.55)
            }
            .multilineTextAlignment(.center)
        }
            Text("")
                .frame(width: 30, height: 50, alignment: .center)
        VStack{
            Text("Score Rankings")
                .frame(width: 180, height: 22, alignment: .center)
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .font(Font.custom("Lato",size: 19))
            VStack{
            Text("Inserire nome dell'utente")
                .frame(width: 300, height: 40, alignment: .center)
                .background(Color.init(red: 0.9, green: 0.91, blue: 0.95))
            Text("Inserire nome dell'utente")
                .frame(width: 300, height: 40, alignment: .center)
                .background(Color.init(red: 0.9, green: 0.91, blue: 0.95))
            Text("Inserire nome dell'utente")
                .frame(width: 300, height: 40, alignment: .center)
                .background(Color.init(red: 0.9, green: 0.91, blue: 0.95))
            }
            .padding(10)
            Text("")
                .frame(width: 30, height: 40, alignment: .center)
            
           
        }
        }.onAppear{
            showRanking()
        }
}
}
struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}