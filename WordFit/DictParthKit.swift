//
//  DictParthKit.swift
//  WordFit
//
//  Created by Luca Rubino on 26/10/21.
//

import Foundation
import ParthenoKit

class DicParthKit{
    var kit : ParthenoKit = ParthenoKit.init()
    
    func read(tag_:String, key_:String) -> Dictionary<"String", "String"> {
        return kit.readSync(team: "TeamF", tag: tag_, key: key_)
    }
}
