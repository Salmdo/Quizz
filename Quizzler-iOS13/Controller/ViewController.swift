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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var questionPB: UIProgressView!
    
    var quizBrain = QuizBrain()
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeQuestion()
    }
    
    @IBAction func answerButton(_ sender: UIButton) {

        timer.invalidate()
        let userAnswer = sender.currentTitle!

        if quizBrain.checkAnswer(userAnswer) {
            print ("Correct")
            sender.backgroundColor = UIColor.green  //Set background color for the button by UI Color
        }
        else {
            print ("Incorrect")
            sender.backgroundColor = UIColor.red
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(clearColor), userInfo: nil, repeats: true)
        quizBrain.nextQuestion()

//        changeQuestion()
    }
    
   
    
    func changeQuestion(){
        questionLabel.text = quizBrain.getQuizQuestion()
//        questionPB.progress = Float(questionNo)/Float(quizz.count)
        
    }
    
    @objc func clearColor(){
        falseButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
        
        questionLabel.text = quizBrain.getQuizQuestion()
        questionPB.progress = quizBrain.getProgress() 
        
    }


}

