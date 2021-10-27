//
//  RakingView.swift
//  WordFit
//
//  Created by Salvo D'Amore on 21/10/21.
//

import SwiftUI

struct RankingView: View {
    @State var first : String = ""
    @State var second : String = ""
    @State var third : String = ""
    @State var fourth : String = ""
    @State var fifth : String = ""
    @State var firstPoint : Int = 0
    @State var secondPoint : Int = 0
    @State var thirdPoint : Int = 0
    @State var fourthPoint : Int = 0
    @State var fifthPoint : Int = 0
    @State var arrName : [String] = []
    @State var arrScore : [Int] = []
/*    @State var kit = DictParthKit.getIstance()
    func showRanking() -> Bool {
        let res = kit.read(tag_: "Score", key_: "1")
        print("sorta", res)
        return true
    }
 */
    
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
                .onAppear(perform: {
                    let kit = DictParthKit.getIstance()
                    kit.DictSort()
                    arrName  = kit.getArrayName()
                    arrScore = kit.getArrayInt()
                    first = arrName[0]
                    second = arrName[1]
                    third = arrName[2]
                    fourth = arrName[3]
                    fifth = arrName[4]
                    firstPoint = arrScore[0]
                    secondPoint = arrScore[1]
                    thirdPoint = arrScore[2]
                    fourthPoint = arrScore[3]
                    fifthPoint = arrScore[4]
                })
        }
            VStack{
                Text("\(appPreferences.getStringPreferences(forKey: "NickName")!)")
                .font(Font.custom("Mallory Mediudm",size: 13.33333333333334))
                .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                .lineSpacing(0.55)
                Text("Score: \(appPreferences.getIntPreferences(forKey: "Score"))")
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
            Text("1° \(first) - Score: \(String(firstPoint))")
                .frame(width: 300, height: 40, alignment: .center)
                .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
            Text("2° \(second) - Score: \(String(secondPoint))")
                .frame(width: 300, height: 40, alignment: .center)
                .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
            Text("3° \(third) - Score: \(String(thirdPoint))")
                .frame(width: 300, height: 40, alignment: .center)
                .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
            Text("4° \(fourth) - Score: \(String(fourthPoint))")
                    .frame(width: 300, height: 40, alignment: .center)
                    .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
            Text("5° \(fifth) - Score: \(String(fifthPoint))")
                    .frame(width: 300, height: 40, alignment: .center)
                    .background(Color.init(red: 0.28, green: 0.32, blue: 0.37))
            }
            .padding(10)
            Text("")
                .frame(width: 30, height: 40, alignment: .center)
            
           
        }
        }
}
}
struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}
