//
//  FirstViewController.swift
//  Project
//
//  Created by Kennedy Bowman on 7/16/17.
//  Copyright © 2017 Kennedy Bowman. All rights reserved.
//

import UIKit

var currentQuestionIndex: Int = 0


class QuizViewController: UIViewController {
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    @IBOutlet var nextQuestionButton: UIButton!
    @IBOutlet var showAnswerButton: UIButton!
    
    //questions and answers
    let questions: [String] = [NSLocalizedString("In which state is the University of Louisville?", comment: "q1"),
                               NSLocalizedString("Where in Canada is Niagara Falls?", comment: "q2"),
                               NSLocalizedString("Where in Italy is the Colosseum?", comment: "q3"),
                               NSLocalizedString("What is the capital of Russia?", comment: "q4"),
                               NSLocalizedString("In what city is Christ the Redeemer?", comment: "q5"),
                               NSLocalizedString("In what city is the Eiffel Tower?", comment: "q6"),
                               NSLocalizedString("In what province does the Great Wall of China begin?", comment: "q7"),
                               NSLocalizedString("In what city is Alcatraz?", comment: "q8"),
                               NSLocalizedString("In which state is Chichen Itza?", comment: "q9"),
                               NSLocalizedString("In what city is the Great Sphinx?", comment: "q10")]
    
    let answers: [String] = [NSLocalizedString("Kentucky", comment: "a1"),
                             NSLocalizedString("Ontario", comment: "a2"),
                             NSLocalizedString("Rome", comment: "a3"),
                             NSLocalizedString("Moscow", comment: "a4"),
                             NSLocalizedString("Rio de Janeiro", comment: "a5"),
                             NSLocalizedString("Paris", comment: "a6"),
                             NSLocalizedString("Liaoning", comment: "a7"),
                             NSLocalizedString("San Francisco", comment: "a8"),
                             NSLocalizedString("Yucatan", comment: "a9"),
                             NSLocalizedString("Giza", comment: "a10")]
    
    //colors
    let textColors: [UIColor] = [UIColor.black, UIColor.red, UIColor.red, UIColor.red, UIColor.yellow, UIColor.blue, UIColor.yellow, UIColor.green, UIColor.red, UIColor.red]
    let backgroundColors: [UIColor] = [UIColor.red, UIColor.white, UIColor.green, UIColor.blue, UIColor.green, UIColor.red, UIColor.red, UIColor.brown, UIColor.green, UIColor.white]
    
    func animateLabelTransitions() {
        UIView.animate(withDuration:2.5,
                       delay:0,
                       options:[],
                       animations:{
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
        },
                       completion: { _ in
                        swap(&self.currentQuestionLabel,
                             &self.nextQuestionLabel)
        })
        
    }
    
    @IBAction func showNextQuestion(sender: AnyObject){
        
        NSLog("Showing next question");
        
        currentQuestionIndex = currentQuestionIndex + 1
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        //set colors
        let textColor = textColors[currentQuestionIndex]
        nextQuestionLabel.textColor = textColor
        answerLabel.textColor = textColor
        nextQuestionButton.setTitleColor(textColor, for: .normal)
        showAnswerButton.setTitleColor(textColor, for: .normal)
        
        let backgroundColor = backgroundColors[currentQuestionIndex]
        self.view.backgroundColor = backgroundColor
        
        self.nextQuestionLabel.alpha = 0
        animateLabelTransitions()
        
    }
    
    @IBAction func showAnswer(sender: AnyObject){
        
        NSLog("Showing the answer");
        
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        //set colors
        let textColor = textColors[currentQuestionIndex]
        currentQuestionLabel.textColor = textColor
        answerLabel.textColor = textColor
        nextQuestionButton.setTitleColor(textColor, for: .normal)
        showAnswerButton.setTitleColor(textColor, for: .normal)
        
        let backgroundColor = backgroundColors[currentQuestionIndex]
        self.view.backgroundColor = backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0
    }

}

