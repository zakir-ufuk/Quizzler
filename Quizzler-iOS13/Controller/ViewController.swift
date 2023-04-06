//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
   // @IBOutlet weak var buttonFour: UIButton! //enable this to make the quiz with 4 choices also enable in line 60
    @IBOutlet weak var scoreLabel: UILabel!
    
    
   var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // *********** WHAT HAPPENS WHEN USER ANSWERS
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle // Returns True or False
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)

        //Change button color depending on if its right or false
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
    quizBrain.nextQuestion()
        //To pause program after changing color so that color can be visible for 0.2 seconds
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    // *********** What happens after
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let answerChoices = quizBrain.getAnswers()
        buttonOne.setTitle(answerChoices[0], for: .normal)
        buttonTwo.setTitle(answerChoices[1], for: .normal)
        buttonThree.setTitle(answerChoices[2], for: .normal)
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
        buttonThree.backgroundColor = UIColor.clear
      //  buttonFour.backgroundColor = UIColor.clear // enable this to make the quiz with 4 choices
        progressBar.progress = quizBrain.getProgress()
    }
    
    
}

