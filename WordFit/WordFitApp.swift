//
//  WordFitApp.swift
//  WordFit
//
//  Created by Renato on 20/10/21.


import SwiftUI
import Foundation
@main
public struct WordFitApp: App {
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    var tmp = Initializer()
    var IsfirstLogin : Bool = appPreferences.getBoolPreferences(forKey: "FirstLogin")
    
    public init() {}

    public var body: some Scene {
        WindowGroup {
            if !IsfirstLogin{
                HomePageView()
                    .environment(\.colorScheme, isDarkMode ? .dark : .light)
            }
            else{ //first access only
                WelcomePageView()
                    .environment(\.colorScheme, isDarkMode ? .dark : .light)
            }
        }
//        .modifier(DarkModeViewModifier())
//        .environment(\.colorScheme, isDarkMode ? .dark : .light)
//        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
