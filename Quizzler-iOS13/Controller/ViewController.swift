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
    @IBOutlet weak var trueBu: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseBu: UIButton!
   var quizBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    @IBAction func answerBu(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        quizBrain.checkAnswer(userAnswer)

        let actualAnswer = quiz[questionNumber].answer
        if userAnswer == actualAnswer{
            sender.backgroundColor = UIColor.green
            print("Right!")
        }
        else{
            sender.backgroundColor = UIColor.red
            print("Wrong!")
        }
        if questionNumber + 1 < quiz.count {
        questionNumber += 1
        }else{
            questionNumber = 0
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    @objc func updateUI(){
        questionLabel.text = quiz[questionNumber].text
        trueBu.backgroundColor = UIColor.clear
        falseBu.backgroundColor = UIColor.clear
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)

    }
}

