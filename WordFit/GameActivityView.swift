//
//  GameActivityView.swift
//  WordFit
//
//  Created by Mario Oliva on 23/10/21.
//

import SwiftUI

struct GameActivityView: View {

    @State var labelRes: String = ""
    
    var body: some View {
        VStack{
        VStack{
        Image("logo")
            .resizable()
            .frame(width: 83, height: 85)
        
            
        Text("Activity Time!")
                .frame(width: 381, height: 60)
                .font(Font.custom("Lato",size: 33.33333333333336))
                .foregroundColor(Color.init(red: 0.87, green: 0.33, blue: 0.4))
                .lineSpacing(0.68)
        
            //inserire al posto di Z il numero di Jumping jacks da fare
        Text("Please, do Z Jumping-Jacks")
                .frame(width: 379, height: 30)
                .font(Font.custom("Lato",size: 28.3))
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .lineSpacing(0.8)
            
        Text("Say 'Start' to start the activity")
                .frame(width: 378, height: 40)
                .font(Font.custom("Lato",size: 26))
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .lineSpacing(0.87)
        }
        
        VStack{
            /*Rectangle()
               .frame(width: 377, height: 500)
               .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
             */
            ActionCameraControllerView(labelResult: $labelRes)
                .edgesIgnoringSafeArea(.top)
        }
            //N è il numero di ripetizioni fatte dall'utente mentre Z è il numero totale di reps
        Text("N/Z")
                .frame(width: 381, height: 50)
                .font(Font.custom("Lato",size: 58.4))
                .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                .lineSpacing(0.425)
      }
   }
}

struct GameActivityView_Previews: PreviewProvider {
    static var previews: some View {
        GameActivityView()
    }
}
