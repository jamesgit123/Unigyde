//
//  SliderQuestion.swift
//  Unigyde
//
//  Created by XCodeClub on 2/7/17.
//  Copyright © 2017 Unigyde. All rights reserved.
//

import Foundation

struct SliderQuestion : Question {
    
    var questionTitle = ""
    var questionText = ""
    var responses : [String] = []
    var value = ""
    
    func updateView() {
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
