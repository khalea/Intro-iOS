//
//  FirstViewController.swift
//  TabbedFlashCards
//
//  Created by Khalea Berry on 2/8/19.
//  Copyright © 2019 C323 Spring 2019 - kjberrys. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // the reference to our AppDelegate:
    var appDelegate: AppDelegate?;
    // the reference to our data model:
    var myFlashCardModel: FlashCardModel?;
    
    // UI Labels to display questions & answers
    @IBOutlet weak var questLabel: UILabel!;
    @IBOutlet weak var answerLabel: UILabel!;
    
    // UI Buttons to interact w Model --> Grab Questions & Answers
    
    @IBAction func questBtn(_ sender: Any) { // Show Question
        
        // obtain a reference to the AppDelegate:
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate;
        
        // from the AppDelegate, obtain a reference to the Model data:
        self.myFlashCardModel = self.appDelegate?.myFlashCardModel;
        
        // Grab a new question from the model
        let currentQuestion : String = self.myFlashCardModel!.getNextQuestion();
        
        // Change questLabel text
        questLabel.text = currentQuestion;
        
        // Clear answer label text
        answerLabel.text = "";
        
    }
    
    @IBAction func answerBtn(_ sender: Any) { // Show Answer
        
        // obtain a reference to the AppDelegate:
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate;
        
        // from the AppDelegate, obtain a reference to the Model data:
        self.myFlashCardModel = self.appDelegate?.myFlashCardModel;
        
        // Grab the proper answer from the model
        let currentAnswer : String = self.myFlashCardModel!.getCurrAnswer();
        
        // Change answerLabel text
        answerLabel.text = currentAnswer;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    


}

