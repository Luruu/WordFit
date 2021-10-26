//
//  DictParthKit.swift
//  WordFit
//
//  Created by Luca Rubino on 26/10/21.
//

import Foundation
import ParthenoKit

class DictParthKit{
    private static var istance : DictParthKit = DictParthKit()
    var kit : ParthenoKit = ParthenoKit.init()
    
    static func getIstance() -> DictParthKit {
        return .istance
    }
    func read(key_:String) -> Dictionary<String, String> {
        return kit.readSync(team: "TeamF", tag: "Ranking", key: key_)
    }
    func write(key_:String, value_:String) -> Bool {
        return kit.writeSync(team: "TeamF", tag: "Ranking", key: key_, value: value_)
    }

    
    func ExistsKey(key: String) -> Bool{
        if read(key_: key).count == 0{
            print("Uniquekey: nome univoco")
            return false
        }
        else {
            print("Uniquekey: nome non univoco")
            return true
        }
    }
    
    func updateRanking(key : String, value : String){
        if(write(key_: key, value_: value)){
            print("writediupdateranking_fatta : ho registrato : ", read(key_: key))
        }else{
            print("writediupdateranking_NONfatta")
        }
        /*var dict: [String: String] = [:]
            dict = read(key_: key)
            print(dict)*/
    }
    
}
