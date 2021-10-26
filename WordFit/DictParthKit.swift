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
    func read(tag_:String, key_:String) -> Dictionary<String, String> {
        return kit.readSync(team: "TeamF", tag: tag_, key: key_)
    }
    func write(tag_:String, key_:String, value_:String) -> Bool {
        return kit.writeSync(team: "TeamF", tag: tag_, key: key_, value: value_)
    }
}
