//
//  Game_session.swift
//

import Foundation

class gameSession{
    private var words : [ Int : WordList] = [:]
    private var exerciseList : [Int: Exercise] = [:]
    private var duration : Timer = Timer.init()
    private var player : [ Int : User] = [:]
    private var score : Int = Int.init()
    
    init(){}
    
    func increaseScore(score : Int){
        self.score += score
    }
    
    func getScore() -> Int {
        return self.score
    }
    
    
}
