//
//  ViewController.swift
//  LectureTwo
//
//  Created by Berry-Simms, Khalea on 1/10/19.
//  Copyright © 2019 Berry-Simms, Khalea. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    
    // Instantiate model
    let fcModel = FlashCardModel();
    
    // Has at least 1 question been shown?
    var questionShown = false;
    
    // Top Question Label
    @IBOutlet weak var questionLabel: UILabel!
    // Bottom Answer Label
    @IBOutlet weak var answerLabel: UILabel!
    
    
    // Action for Show Question Btn
    @IBAction func showQuestion(_ sender: UIButton) {
        
        // Get a new question and store in a variable
        let question1 : String = fcModel.getNextQuestion();
        // Set question label text to question
        self.questionLabel.text = question1;
        // Set answer label text
        self.answerLabel.text = "Take a guess!";
        // Set questionShown to True
        if (questionShown == false) {
            questionShown = true;
        }
        
    }
    
    // Action for Show Answer Btn
    @IBAction func showAnswer(_ sender: Any) {
        
        if (questionShown == true) {
        
            let answer : String = fcModel.getAnswer();
            self.answerLabel.text = answer;
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.questionLabel.text = "Hello World"
    }


}

