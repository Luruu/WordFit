//
//  WarningsView.swift
//  WordFit
//
//  Created by Salvo D'Amore on 21/10/21.
//

import SwiftUI

struct WarningsView: View {
    var body: some View {
        VStack{
            Text("WordFit")
//                .font(.system(size: 66.67))
                .font(Font.custom("Mallory",size: 40))
                .tracking(3.5)
                .lineSpacing(1.67)
                .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                .frame(width: 221, height: 51,alignment: .center)
            
            Spacer()
            Text("Warnings")
                .frame(width: 180, height: 32, alignment: .center)
                .font(Font.custom("Lato",size: 27))
                .lineSpacing(1.29)
                .foregroundColor(Color.init(red: 0.87, green: 0.33, blue: 0.4))
                .padding()
            Text("1) Do some warm-up exercises before playing.\n\n2) Do not play in dangerous places (example: bus).\n\n3) Do not play if you have particular mobility problems. \n\n4) Don't play too many hours a day. \n\n5) be careful what happens around you when you play.")
                .frame(width: 312, height: 425, alignment: .center)
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

struct WarningsView_Previews: PreviewProvider {
    static var previews: some View {
        WarningsView()
    }
}
