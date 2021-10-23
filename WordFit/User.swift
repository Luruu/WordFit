//
//  User.swift
//  WordFit
//
//  Created by Renato on 20/10/21.
//

import Foundation

class User{
    private var nickName : String?
    private var score: Int = Int.init()
    private var id : Int = Int.init()
    private var imageProfile : String?
    private var trophies : Array<Trophy> = []
    
    init(name: String) {
        self.nickName = name
    }
    
    func setNickName(name: String, pathImage : String){
        self.nickName = name
    }
    
    func getNickName() -> String?{
        return self.nickName
    }
    
    func setID(id : Int){
        self.id = id
    }
    
    func getID() -> Int{
        return self.id
    }
    
    func increseScore(score : Int){
        self.score += score
    }
    
    func getScore() -> Int {
        return self.score
    }
    
    func addTrophy(trophy : Trophy){
        self.trophies.append(trophy)
    }
    
    func getTrophy(index : Int) -> Trophy{
        return self.trophies[index]
    }
}
