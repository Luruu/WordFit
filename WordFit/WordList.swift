//
//  WordList.swift
//  WordFit
//
//  Created by Renato on 21/10/21.
//

import Foundation

class WordList{
    private var wordList : Array<Word> = Array.init()
    private var lenght : Int = Int.init()
    
    init(){
        let word : Word = loadJson(fileName: "test2")
        print(word.value)
    }
    
    func addElement(name : String, points : Int, sugg : String){
        wordList.append(Word(value: name, score : points, suggestion : sugg ))
    }
    
    func loadJson(fileName : String) -> Word{
        let decoder = JSONDecoder()
        guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"), let data = try? Data(contentsOf: url), let persona = try? decoder.decode(Word.self, from: data)
        else{
            fatalError("Stampo nill perché guard ha fallito")
        }
        return persona
    }
    
}

