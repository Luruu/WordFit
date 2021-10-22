//
//  AppPreferences.swift
//  WordFit
//
//  Created by Renato on 22/10/21.
//

import Foundation
class appPreferences{
    
    init(){}
    
    static func loadPreferences(){
        UserDefaults.standard.set(true, forKey: "NotEmpty")
        UserDefaults.standard.set(false, forKey: "DarkMode")
        UserDefaults.standard.set(false, forKey: "Audio")
        UserDefaults.standard.set("", forKey: "NickName")
        UserDefaults.standard.set(0, forKey: "Score")
        let Array = [Int]()
        UserDefaults.standard.set(Array, forKey: "Tropies")
        UserDefaults.standard.set(true, forKey: "FirstLogin")
        UserDefaults.standard.set(true, forKey: "FirstWorld")
    }
    
    static func getIntPreferences(forKey: String)-> Int{
        UserDefaults.standard.integer(forKey:forKey)
    }
    
    static func getStringPreferences(forKey: String)-> String?{
        UserDefaults.standard.string(forKey:forKey)
    }
    
    static func getBoolPreferences(forKey: String)-> Bool{
        UserDefaults.standard.bool(forKey:forKey)
    }
    
    static func getIntArrayPreferences(forKey: String)-> Any?{
        UserDefaults.standard.object(forKey:forKey)
    }
    
    static func setBoolPreferences(forKey : String, value : Bool){
        UserDefaults.standard.set(value, forKey: forKey)
    }
    
}
