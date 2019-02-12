//
//  ViewController.swift
//  GuessWhat
//
//  Created by Berry-Simms, Khalea on 1/15/19.
//  Copyright © 2019 Berry-Simms, Khalea. All rights reserved.
//

// TODO: add functionality for generating a new number after winning

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lowerButton: UIButton! // Button to raise guess
    @IBOutlet weak var raiseButton: UIButton! // Button to lower guess
    @IBOutlet weak var checkButton: UIButton! // Button to Check Guess
    @IBOutlet weak var currNumLabel: UILabel! // Label for current number (being guessd)
    @IBOutlet weak var flavorText: UILabel! // Tells you if you won
    
    
    var numberToBeGuessed = 0 // Correct guess
    var userNumber = 0 // User's guess
    
    
    
    
    @IBAction func guessLower(_ sender: Any) { // Subtract 1 from the current guess
        
        userNumber = userNumber - 1
        self.currNumLabel.text = String(userNumber) // Subtract, convert to string
        
    }
    
    @IBAction func guessHigher(_ sender: Any) { // Add 1 to the current guess
        
        userNumber = userNumber + 1
        self.currNumLabel.text = String(userNumber) // Add, convert to string
    }
    
    
    @IBAction func checkGuess(_ sender: Any) {
        
        if userNumber == numberToBeGuessed {
            
            self.flavorText.text = "You Won!" // Change text underneath number
            
            
            // TODO - Figure out how to reset everything
            // 1) Change checkButton text from "Check My Guess" to "Guess Again"
            // 2) Reset userNumber & currNumLabel text to 0
            // 3) Generate a new numberToBeGuessed
            // 4) Make it so that clicking checkButton AGAIN will change text to "Check My Guess!"
            // 5) Make checkGuess run again
            
            // Generate a new number & reset guess to 0
            checkButton.setTitle("Guess again!", for: .normal) // Change btn text
            userNumber = 0 // Reset number
            numberToBeGuessed = Int(arc4random_uniform(10)) // Generate a new num
            
        } else {
           
            self.flavorText.text = "Try again!" // Set flavor text to guess again
            
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Generate a random number for initial use
        numberToBeGuessed = Int(arc4random_uniform(10))
        print("The correct number is... \(self.numberToBeGuessed)")
        
    }


}

