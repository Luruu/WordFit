//
//  WordFitApp.swift
//  WordFit
//
//  Created by Renato on 20/10/21.


import SwiftUI
import Foundation
@main
struct WordFitApp: App {
    var tmp = Initializer()
    var IsfirstLogin : Bool = appPreferences.getBoolPreferences(forKey: "FirstLogin")
    var body: some Scene {
        WindowGroup {
            if !IsfirstLogin{
                HomePageView()
            }
            else{ //first access only
                WelcomePageView()
            }
        }
    }
}
