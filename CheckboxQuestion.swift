//
//  CheckboxQuestion.swift
//  Unigyde
//
//  Created by XCodeClub on 1/9/17.
//  Copyright © 2017 Unigyde. All rights reserved.
//

import Foundation

struct CheckboxQuestion : Question {
    
    var questionTitle = ""
    var questionText = ""
    var options = [""]
    var responses = [""]
    
    func updateView() {
        // go to CheckboxViewController
    }
    
    func getTitle() -> String {
        return questionTitle
    }
    
    func getText() -> String {
        return questionText
    }
    
    func getOptions() -> [String] {
        return options
    }
    
    func getResponse() -> [String] {
        return responses
    }
    
}
