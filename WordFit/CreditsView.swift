//
//  CreditsView.swift
//  WordFit
//
//  Created by Mario Oliva on 25/10/21.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        NavigationView{
        
        VStack{
            Text("WordFit")
//                .font(.system(size: 66.67))
                .font(Font.custom("Mallory",size: 40))
                .tracking(3.5)
                .lineSpacing(1.67)
                .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                .frame(width: 221, height: 51,alignment: .center)
            
            Text("")
                .frame(width: 30, height: 80, alignment: .center)
            
            Text("Credits")
                .frame(width: 180, height: 32, alignment: .center)
                .font(Font.custom("Lato",size: 27))
                .lineSpacing(1.29)
                .foregroundColor(Color.init(red: 0.87, green: 0.33, blue: 0.4))
                .padding()
            Text("This app is created by :\nBorriello Giovanni Rosario\nD'Amore Salvatore\nDe Rosa Salvatore\nEsposito Renato\nOliva Mario\nPiscitelli Vittorio\nRubino Luca\nTerraciano Vincenzo\nVacca Maria\nZagaria Emanuele Raffaele")
                .font(Font.custom("Lato",size: 20))
                .frame(width: 380, height: 300, alignment: .center)
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .lineSpacing(1)
                .padding()
                
            Text("")
                .frame(width: 30, height: 90, alignment: .center)
            
            Image("logo")
                .resizable()
                .frame(width: 96, height: 95, alignment: .center)
            Text("")
                .frame(width: 30, height: 120, alignment: .center)

        }
      }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
