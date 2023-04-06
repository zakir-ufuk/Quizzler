//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Zakir Ufuk Sahiner on 04.04.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], cA: String){
        text = q
        answer = a
        correctAnswer = cA
    }
}

