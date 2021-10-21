//
//  Sword.swift
//  WordFit
//
//  Created by Renato on 21/10/21.
//

import Foundation

class Word{
    private var value : String
    private var score : Int
    private var suggestion : String
    
    init(value: String, score : Int, suggestion : String){
        self.score = score
        self.value = value
        self.suggestion = suggestion
    }
    
    func getValue() -> String {
        return self.value
    }
    
    func getScore() -> Int{
        return self.score
    }
    
    func getSuggestion() -> String{
        return self.suggestion
    }
    
}
