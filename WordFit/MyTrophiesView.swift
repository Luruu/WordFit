//
//  MyTrophiesView.swift
//  WordFit
//
//  Created by Salvo D'Amore on 22/10/21.
//

import SwiftUI

struct MyTrophiesView: View {
    @State var nickname = appPreferences.getStringPreferences(forKey: "NickName")
    @State var myscore = appPreferences.getIntPreferences(forKey: "Score")
    var trophies = appPreferences.getIntPreferences(forKey: "Tropies")
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
                    Text(nickname ?? "No name")
                    .font(Font.custom("Mallory Mediudm",size: 13.33333333333334))
                    .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                    .lineSpacing(0.55)
                Text("Score: \(myscore), Trophies:?")
                    .font(Font.custom("Lato",size: 13.33333333333334))
                    .foregroundColor(Color.init(red: 0.28, green: 0.32, blue: 0.37))
                    .lineSpacing(0.55)
                }
                .multilineTextAlignment(.center)
            }
            Text("")
                .frame(width: 30, height: 70, alignment: .center)
            VStack{
                Text("My Trophies")
                    .frame(width: 211, height: 40,alignment: .center)
                    .foregroundColor(Color.init(red: 0.8, green: 0.08, blue: 0.41))
                    .font(Font.custom("Lato",size: 27))
                    .lineSpacing(0.75)
            }
            Text("")
                .frame(width: 30, height: 10, alignment: .center)
            VStack{
                HStack{
                    ZStack{
                    Rectangle()
                        .frame(width: 66, height: 67)
                        .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                        if(trophies == 0) {
                            Image("Raster10")
                                .resizable()
                                .frame(width: 66, height: 67)
                                .hidden()
                        }
                        else{
                            Image("Raster10")
                                .resizable()
                                .frame(width: 66, height: 67)
                        }
                       
                    }
                    
                    ZStack{
                    Rectangle()
                        .frame(width: 66, height: 67)
                        .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                        /*  Image("Raster8")
                            .resizable()
                            .frame(width: 66, height: 67) */
                    }
                    ZStack{
                    Rectangle()
                        .frame(width: 66, height: 67)
                        .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                        /*  Image("Raster7")
                            .resizable()
                            .frame(width: 66, height: 67) */
                    }
                    ZStack{
                    Rectangle()
                        .frame(width: 66, height: 67)
                        .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                        /*  Image("Raster6")
                            .resizable()
                            .frame(width: 66, height: 67) */
                    }
                }
                HStack{
                    ZStack{
                    Rectangle()
                        .frame(width: 66, height: 67)
                        .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                        /*   Image("Raster1")
                            .resizable()
                            .frame(width: 66, height: 67) */
                    }
                    ZStack{
                    Rectangle()
                        .frame(width: 66, height: 67)
                        .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                        /*  Image("Raster2")
                            .resizable()
                            .frame(width: 66, height: 67) */
                    }
                    ZStack{
                    Rectangle()
                        .frame(width: 66, height: 67)
                        .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                        /*  Image("Raster3")
                            .resizable()
                            .frame(width: 66, height: 67) */
                    }
                    ZStack{
                    Rectangle()
                        .frame(width: 66, height: 67)
                        .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                        /*  Image("Raster4")
                            .resizable()
                            .frame(width: 66, height: 67) */
                    }
                }
                HStack{
                    ZStack{
                    Rectangle()
                        .frame(width: 66, height: 67)
                        .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                        /*    Image("Raster5")
                            .resizable()
                            .frame(width: 66, height: 67) */
                    }
                    ZStack{
                    Rectangle()
                        .frame(width: 66, height: 67)
                        .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                         /*  Image("Raster9")
                            .resizable()
                            .frame(width: 66, height: 67) */
                    }
                    ZStack{
                    Rectangle()
                        .frame(width: 66, height: 67)
                        .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                          /* Image("Raster11")
                            .resizable()
                            .frame(width: 66, height: 67) */
                    }
                    ZStack{
                    Rectangle()
                        .frame(width: 66, height: 67)
                        .foregroundColor(Color.init(red: 0.9, green: 0.91, blue: 0.95))
                    }
                }
                Text("")
                    .frame(width: 30, height: 30, alignment: .center)
                Image("logo")
                    .resizable()
                    .frame(width: 96, height: 95, alignment: .center)
            
}
        }
}
}

struct MyTrophiesView_Previews: PreviewProvider {
    static var previews: some View {
        MyTrophiesView()
    }
}
