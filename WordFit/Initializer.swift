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
        //appPreferences.setBoolPreferences(forKey: "Empty", value: true)
        let isNotEmpty = appPreferences.getBoolPreferences(forKey: "NotEmpty")
        
        print("isNotEmpty: ",isNotEmpty)
        print("aaaa: ",appPreferences.getBoolPreferences(forKey: "FirstLogin")
)
        if (isNotEmpty == false) { //it's empty
            print("empty, carico i valori di default.")
            appPreferences.loadPreferences()
       }
        
        //UserDefaults.standard.removeObject(forKey: "NotEmpty")
        //print("rimosso")
    }
}
