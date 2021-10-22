//
//  Decoder.swift
//  WordFit
//
//  Created by Renato on 22/10/21.
//

import Foundation
/*
    this class has the goal of decoding the json file and returning an array of type Word (If necessary we make it generic)
 */

class Decoder{    
    static func loadJson(fileName : String) -> [Word]{
        let decoder = JSONDecoder()
        var url : URL?
        var result : [Word]?
        url = Bundle.main.url(forResource: fileName, withExtension: "json")
        
        
        guard let data =  try? Data(contentsOf: url!) else{
            fatalError("There are problems with Data buffering ")
        }
        
        do{
            result = try decoder.decode([Word].self, from: data)
        } catch{
            print(error)
            fatalError("Decoding failed.")
        }
        return result!
    }
}
