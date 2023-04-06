//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Zakir Ufuk Sahiner on 06.04.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let Questions = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], cA: "Skin"),
               Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], cA: "100"),
               Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], cA: "Greenwich Mean Time"),
               Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], cA: "Chapeau"),
               Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], cA: "Watch"),
               Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], cA: "Adiós"),
               Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], cA: "Orange"),
               Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], cA: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], cA: "Gorilla"),
                Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], cA: "Australia")
    ]
    
    /*
     //Questions and Answers in 2D Array (Alternative to store questions and answers for them)
     let Questions = [["Four + Two is equal to Six.", "True"], ["Five - Three is greater than One", "True"], ["Three + Eight is less than Ten","False" ]]
          */
    
    var questionNumber = 0 //Question Number
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == Questions[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    func getScore() -> Int {
        return score
    }
    
    func getQuestionText() -> String {
        return Questions[questionNumber].text
    }
    
    func getAnswers() -> [String] {
        return Questions[questionNumber].answer.shuffled() // made the choices shuffled so it would be more fun!
        }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(Questions.count)
        return progress
    }
    
    mutating func nextQuestion()  {
        if questionNumber + 1 < Questions.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
}
