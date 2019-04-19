//
//  FlashCardModel.swift
//  TabbedFlashCards
//
//  Created by Khalea Berry on 2/8/19.
//  Copyright © 2019 C323 Spring 2019 - kjberrys. All rights reserved.
//

import Foundation

class FlashCardModel {
    
    // Index of current question
    var currentQA = -1;
    
    // TODO add more questions
    // List of Questions
    var questions = [
        "The ancient Egyptian symbol Ouroboros depicts a serpent eating what?", "Isaac Newton was hit by what fruit?","What is the previous name of the Russian city, Volgograd?"
    ];
    
    // List of Answers
    var answers = [
        "Its own tail", "An apple", "Stalingrad"
    ];
    
    
    func getNextQuestion() -> String {
        
        // Increment up the questions array
        currentQA = currentQA + 1;
        
        // Reset to 1st question if all have been reached
        if (currentQA >= questions.count) {
            currentQA = 0;
        }
        
        return questions[currentQA];
    }
    
    
    func getCurrQuestion() -> String {
        
        if currentQA == -1 {
            return "You haven't looked at any cards yet!";
        } else {
            return questions[currentQA];
        }
        
    }
    
    func getCurrAnswer() -> String {
        
        if currentQA == -1 {
            
            return "You haven't looked at any cards yet!"
            
        } else {
        
            return answers[currentQA];
        
        }
        
    }
    
    
    
    func setCurrentQuestion(pString: String) {
        
        if (currentQA > -1) {
            questions[currentQA] = pString;
            
        }
    }
    
    
    func setCurrentAnswer(aString : String) {
        
        if (currentQA > -1) {
        answers[currentQA] = aString;
        }
    }
    
    func getCurrIndex() -> Int {
        return currentQA;
    }
}
