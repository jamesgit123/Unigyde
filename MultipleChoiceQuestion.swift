//
//  MultipleChoiceQuestion.swift
//  Unigyde
//
//  Created by XCodeClub on 12/21/16.
//  Copyright © 2016 Unigyde. All rights reserved.
//

import Foundation

struct MultipleChoiceQuestion : Question {

    var questionTitle = ""
    var questionText = ""
    var responses : [String] = []
    var value = ""
    
    func updateView() {
        // go to MultipleChoiceViewController
    }
    
    func getTitle() -> String {
        return questionTitle
    }
    
    func getText() -> String {
        return questionText
    }
    
    func getOptions() -> [String] {
        return responses
    }
    
    func getResponse() -> [String] {
        return [value]
    }
}
