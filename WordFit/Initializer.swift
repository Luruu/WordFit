//
//  Initializer.swift
//  WordFit
//
//  Created by Renato on 22/10/21.
//

import Foundation
class Initializer{
    init(){
        WordList()
        appPreferences.loadPreferences()
        print(appPreferences.getIntArrayPreferences(forKey: "Trophy"))
    }
}
