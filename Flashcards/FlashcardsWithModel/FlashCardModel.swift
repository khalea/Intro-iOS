//
//  FlashCardModel.swift
//  FlashcardsWithModel
//
//  Created by Khalea Berry on 1/25/19.
//  Copyright © 2019 Khalea Berry. All rights reserved.
//

// BONUS TODO - Add random number gen to pick out random index in question & answer arrays

import Foundation


class FlashCardModel {
    
    // Index of current question
    var currentQuestion = 0;
    
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
        currentQuestion = currentQuestion + 1;
        
        // Reset to 1st question if all have been reached
        if (currentQuestion >= questions.count) {
            currentQuestion = 0;
        }
        
        return questions[currentQuestion];
    }
    
    
    func getAnswer() -> String {
        
        return answers[currentQuestion];
        
    }
    
    
    
    
}
