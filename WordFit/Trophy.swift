//
//  Trophy.swift
//  WordFit
//
//  Created by Renato on 20/10/21.
//

import Foundation

class Trophy{
    private var name : String
    private var imagePath : String?
    private var description: String
    private var pointValue: Int = Int.init()

    
    init(name : String, description : String){
        self.name = name
        self.description = description
    }
    
    func setPointValue(value : Int){
        pointValue = value
    }
    
    func getPointValue() -> Int{
        return self.pointValue
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getDescription() -> String{
        return self.description
    }
}
