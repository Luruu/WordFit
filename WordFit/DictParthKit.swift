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
    var arrScore : [Int] = Array.init()
    var arrName : [String] = Array.init()
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
    
    func updateRanking(key : String) -> Bool{
        var count : Int = 0
        if key != "No nickname"{ //if user has nickname score will stored.
            if(ExistsKey(key: key)){ // user have just a score, i have to increase it
                let tmp = read(key_: key)
                count = Int(appPreferences.getStringPreferences(forKey: "Score")!)! + Int(tmp.first!.value)!
                write(key_: key, value_: String(count))
                print("\(count) registrato a utente : \(key)")
            }
            else{
                write(key_: key, value_: appPreferences.getStringPreferences(forKey: "Score")!)
            }
            return false
        }
        else{
            return true
        }
    }
    
    func DictSort(){
        let d : Dictionary<String,String> = read(key_: "%")
        var i = 0
        for (k,v) in (Array(d).sorted {Int($0.1)! >= Int($1.1)!}) {
            arrName.append(k)
            arrScore.append(Int(v)!)
            i+=1
        }
    }
    
    func getArrayName() -> [String]{
        return arrName
    }
    
    func getArrayInt() -> [Int]{
        return arrScore
    }
    
}
