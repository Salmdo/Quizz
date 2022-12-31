//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Salmdo on 12/30/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain{
    let quizz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")


    ]
    
    var questionNo = 0
    var currentScore = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quizz[questionNo].correctAnswer {
            currentScore += 1
            return true
        }
        else {
            return false
        }
    }
    
    func getQuizQuestion() -> String{
        return  quizz[questionNo].text
    }
    
    func getProgress() -> Float{
        return Float(questionNo + 1)/Float(quizz.count)
    }
    
    mutating func nextQuestion() {
        if(questionNo < quizz.count-1){
            questionNo += 1
        }
        else{
            currentScore = 0
            questionNo = 0
        }
    }
    
    func getScore () -> Int{ return currentScore }
    
    func getAnswer() -> [String]{ return quizz[questionNo].anwser }
    
}
