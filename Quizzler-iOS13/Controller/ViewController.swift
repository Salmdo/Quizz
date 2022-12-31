//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionPB: UIProgressView!
    
    var quizBrain = QuizBrain()
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeUI()
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
        
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(changeUI), userInfo: nil, repeats: true)
        quizBrain.nextQuestion()

//        changeQuestion()
    }
    
   
//
//    func changeQuestion(){
//        questionLabel.text = quizBrain.getQuizQuestion()
////        questionPB.progress = Float(questionNo)/Float(quizz.count)
//
//    }
    
    @objc func changeUI(){
        answer1Button.backgroundColor = UIColor.clear
        answer2Button.backgroundColor = UIColor.clear
        answer3Button.backgroundColor = UIColor.clear
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuizQuestion()
        questionPB.progress = quizBrain.getProgress()
        
        answer1Button.setTitle(quizBrain.getAnswer().first, for: .normal)
        answer2Button.setTitle(quizBrain.getAnswer()[1], for: .normal)
        answer3Button.setTitle(quizBrain.getAnswer().last, for: .normal)
        
    }


}

