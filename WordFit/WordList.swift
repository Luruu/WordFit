//
//  WordList.swift
//  WordFit
//
//  Created by Renato on 21/10/21.
//

import Foundation

class WordList{
    private var wordList : [Int: Word] = [:]
    private var lenght : Int = Int.init()
    
    init(){
//        TMP contiene l'array di word preso dal file json
        let tmp : [Word] = Decoder.loadJson(fileName: "word")
//        mettere ogni obj di tmp in un dict chiavere:valore che rappresenta la nostra lista.
        for i in 0...tmp.count - 1{
            addElement(key: i, value: tmp[i])
        }
    }
    
    func addElement(key : Int , value : Word){
        var tmp  = value
        tmp.setUsed(flag: false)
        wordList.updateValue(tmp, forKey: key)
    }
    
    func getElementsFromWordList(index : Int) -> Word?{
        return wordList[index]
    }
    
    func printList(){
        for item in wordList {
            print(item.key)
            print(item.value)
        }
    }
    
}

