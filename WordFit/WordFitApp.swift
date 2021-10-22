//
//  WordFitApp.swift
//  WordFit
//
//  Created by Renato on 20/10/21.


import SwiftUI

@main
struct WordFitApp: App {
    var tmp = Initializer()
    var result : Bool = appPreferences.getBoolPreferences(forKey: "FirstLogin")
    var body: some Scene {
        WindowGroup {
            if result{
                WelcomePageView()
            }
            else{
                HomePageView()
            }
           
//            RakingView()
//            WarningsView()
//            GameRulesView()
//            SettingsView()

//            MyTrophiesView()
            
        }
    }
//    var test = WordList()
    
}
