//
//  Initializer.swift
//  WordFit
//
//  Created by Renato on 22/10/21.
//

import Foundation

class Initializer{
    init(){
        WordList.getIstance().listInitializer()
        let result = appPreferences.getBoolPreferences(forKey: "Empty")
        if result{
//            it's empty
            appPreferences.loadPreferences()
        }
    }
}
