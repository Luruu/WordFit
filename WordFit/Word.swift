//
//  Sword.swift
//  WordFit
//
//  Created by Renato on 21/10/21.
//

import Foundation
import SwiftUI

struct Word: Decodable{
    
    private var value : String
    private var suggestion : String
    var used : Bool?
    
    init(value: String, score : Int, suggestion : String){
//      self.score = score
        self.value = value
        self.suggestion = suggestion
        self.used = false
    }
    
    func getValue() -> String {
        return self.value
    }
    
    func getScore() -> Int{
        value.count
    }
    
    func getSuggestion() -> String{
        return self.suggestion
    }
    
    mutating func setUsed(flag : Bool){
        self.used = flag
    }
    
    func getUsed()->Bool{
        return self.used!
    }
    
}
