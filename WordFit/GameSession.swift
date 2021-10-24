//
//  Game_session.swift
//

import Foundation

class gameSession{
    private var wordList = WordList.getIstance()
    private var exerciseList : [Int: Exercise] = [:]
    private var duration : Timer = Timer.init()
    private var player : User
    private var sessionScore : Int = Int.init()
    
    func increaseScore(score : Int){
        self.sessionScore+=score
    }

    init(player : User){
        self.player = player
    }
    
    private func findUnusedWord() -> Word?{
        var a_word = wordList.getElementsFromWordList(index: 0)
        var randIndex : Int
        while((a_word?.getUsed())!){
            randIndex = Int.random(in: 1...wordList.getSize() - 1)
            a_word = wordList.getElementsFromWordList(index: randIndex)
        }
        return a_word
    }
    
    func getWord() -> Word?{
        var proposed_word = findUnusedWord()
        proposed_word?.setUsed(flag: true)
        print("Word is: \(proposed_word ?? nil)") //se è null, allora sarà mostrato nil penso.
        return proposed_word
        
    }
    
}
