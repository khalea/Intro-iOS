//
//  SecondViewController.swift
//  TabbedFlashCards
//
//  Created by Khalea Berry on 2/8/19.
//  Copyright © 2019 C323 Spring 2019 - kjberrys. All rights reserved.
//

// TODO --> Edit Question fields only show current Q&A once if you view a question before you go to the 2nd tab

import UIKit

class SecondViewController: UIViewController {

    // the reference to our AppDelegate:
    var appDelegate: AppDelegate?;
    // the reference to our data model:
    var myFlashCardModel: FlashCardModel?;
    
    // Variables for Create Card text fields
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var answerField: UITextField!
    
    // Edit Q&A Fields
    @IBOutlet weak var editQuestField: UITextField!
    @IBOutlet weak var editAnsField: UITextField!
    
    // Outputs various responses to user
    @IBOutlet weak var outputLabel: UILabel!
    
    
    
    // Action --> Edit the contents of an existing card
    @IBAction func buttonOKAction(_ sender: Any) {
        
        if (editQuestField.text != "") && (editAnsField.text != "") {
        
        // Store user input in variables
        let userQuestion = editQuestField.text!
        let userAnswer = editAnsField.text!;
        
        print(userQuestion);
        print(userAnswer);
        
        self.myFlashCardModel?.setCurrentQuestion(pString: userQuestion);
        self.myFlashCardModel?.setCurrentAnswer(aString: userAnswer);
        
        editQuestField.text = "";
        editAnsField.text = "";
            
        outputLabel.text = "Your edit: \n Q: \(userQuestion) \n A: \(userAnswer)";
            
        } else {
            
            outputLabel.text = "No text in text edit fields";
            
        }
        
    }
    
    
    // createCardBtn --> Add Q&A to their respective arrays
    // Show some confirmation that it's been added
    @IBAction func createCardBtn(_ sender: Any) {
        
        if (questionField.text != "") && (answerField.text != "") {
        
        // obtain a reference to the AppDelegate:
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate;
        
        // from the AppDelegate, obtain a reference to the Model data:
        self.myFlashCardModel = self.appDelegate?.myFlashCardModel;
        
        // Store text field contents in variables
        let myQuestion = questionField.text;
        let myAnswer = answerField.text;
        
        // Add Q&A to Model
        self.myFlashCardModel?.questions.append(myQuestion!);
        self.myFlashCardModel?.answers.append(myAnswer!);
        
        // Clear text fields
        questionField.text = "";
        answerField.text = "";
            
        outputLabel.text = "Created card: \n Q: \(myQuestion!) \n A: \(myAnswer!)";
            
        } else {
            
            outputLabel.text = "No text in questionField or answerField";
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // Refreshes the data on each viewing of Second View
    override func viewWillAppear(_ animated: Bool) {
        
        print("VWA working");
        
        // obtain a reference to the AppDelegate:
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate;
        
        // from the AppDelegate, obtain a reference to the Model data:
        self.myFlashCardModel = self.appDelegate?.myFlashCardModel;
        
        // Set text edit flashcard fields to the current question
        editQuestField.text = self.myFlashCardModel?.getCurrQuestion();
        editAnsField.text = self.myFlashCardModel?.getCurrAnswer();
        
        
    }

}

