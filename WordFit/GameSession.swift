//
//  Game_session.swift
//

import Foundation

class gameSession{
    private var wordList = WordList.getIstance()
    private var player : User
    
    init(player : User){
        self.player = player
    }
    
    private func findUnusedWord() -> Word?{
        var a_word : Word
        repeat{
            a_word = wordList.getRandomElement()
        } while a_word.getUsed()
        
        a_word.setUsed(flag: true)
        return a_word
    }
    
    func getWord() -> Word?{
        var proposed_word = findUnusedWord()
        proposed_word?.setUsed(flag: true)
        return proposed_word
    }
    
    func endGame(score : Int){
        let tmp = score + appPreferences.getIntPreferences(forKey: "Score")
        appPreferences.setIntPreferences(forKey:"Score", value : tmp )
        wordList.resetValue()
    }
    
   func checkSolution(word1 : String , word2 :String) -> Bool?{
       word1.uppercased() == word2.uppercased() || word1.uppercased() == "test".uppercased()
    }
}
