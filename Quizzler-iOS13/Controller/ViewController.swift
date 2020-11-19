//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var trueButtonOutlet: UIButton!
    @IBOutlet weak var falseButtonOutlet: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizModel = QuizModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        updateUI()
        progressBar.progress = 0.0
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if quizModel.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizModel.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        scoreLabel.text = "Score: \(quizModel.getScore())" 
        quizLabel.text = quizModel.getQuestion()
        progressBar.progress = quizModel.getProgress()
        trueButtonOutlet.backgroundColor = .clear
        falseButtonOutlet.backgroundColor = .clear
    }
    
}

