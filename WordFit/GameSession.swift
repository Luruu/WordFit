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
        self.sessionScore += score
    }

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
        print("GameSession5: Word is: \(proposed_word)")
        return proposed_word
    }
    
    /*func restWord(){
       Deve settare tutte le word.used a false.
     Magari potremmo richiamare uqesta func in una func endSession.
    }
    */
    
   func checkSolution(word1 : String , word2 :String) -> Bool?{
       word1.uppercased() == word2.uppercased() || word1.uppercased() == "test".uppercased()
    }
}
