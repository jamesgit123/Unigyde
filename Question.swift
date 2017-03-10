//
//  Question.swift
//  Unigyde
//
//  Created by XCodeClub on 12/21/16.
//  Copyright © 2016 Unigyde. All rights reserved.
//

import Foundation

protocol Question {
    
    func updateView() -> Void // update the screen view and storyboard for question format(checkbox, multiple choice etc.)
    
    func getTitle() -> String  // string for question title
    
    func getText() -> String // string for question text
    
    func getOptions() -> [String] // string for question options
    
    func getResponse() -> [String] // string for question responses
    
}
