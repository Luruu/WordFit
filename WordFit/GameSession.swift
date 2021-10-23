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
    
    func getWord() -> Word?{
        var flag = true
        var i : Int = Int.random(in: 0...wordList.getSize() - 1)
        var proposed_word = wordList.getElementsFromWordList(index: i)
        
        while(flag){
            if !(proposed_word?.getUsed())! { //not used yet
                flag = false
            }
            i = Int.random(in: 0...wordList.getSize() - 1)
            proposed_word = wordList.getElementsFromWordList(index: i)
        }
        proposed_word?.setUsed(flag: true)
        print("Word is: \(proposed_word)")
        return proposed_word
        
    }
    
}
