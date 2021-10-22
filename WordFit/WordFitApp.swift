//
//  WordFitApp.swift
//  WordFit
//
//  Created by Renato on 20/10/21.


import SwiftUI

@main
struct WordFitApp: App {
    var tmp = Initializer()
    var body: some Scene {
        WindowGroup {
//            WelcomeView()
            if "Ciao" == "Ciao"{
                RakingView()
            }
//            HomePageView()
//            RakingView()
//            WarningsView()
//            GameRulesView()
//            SettingsView()
            MyTrophiesView()
            
        }
    }
//    var test = WordList()
    
}
