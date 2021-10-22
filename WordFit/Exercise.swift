//
//  Exercise.swift
//  WordFit
//
//  Created by Renato on 22/10/21.


import Foundation

class Exercise{

private var name : String
private var exerciseImage : String?

    init(name : String, exerciseImage : String){
        self.name = name
        self.exerciseImage = exerciseImage
    }

    func getName() -> String{
        return self.name
    }

    func getExercise() -> String?{
        return self.exerciseImage
    }
    
}
