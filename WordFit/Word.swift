//
//  Sword.swift
//  WordFit
//
//  Created by Renato on 21/10/21.
//

import Foundation

struct Word: Decodable{
    
    var value : String
    var suggestion : String
//  private var score : Int

    
    init(value: String, score : Int, suggestion : String){
//      self.score = score
        self.value = value
        self.suggestion = suggestion
    }
    
    func getValue() -> String {
        return self.value
    }
    
    func getScore() -> Int{
//        return self.score
        return 0
    }
    
    func getSuggestion() -> String{
        return self.suggestion
    }
    
}
