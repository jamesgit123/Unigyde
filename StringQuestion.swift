//
//  StringQuestion.swift
//  Unigyde
//
//  Created by XCodeClub on 12/21/16.
//  Copyright © 2016 Unigyde. All rights reserved.
//

import Foundation


struct StringQuestion: Question {
    
    var title = ""
    var text = ""
    var options:[String] = []
    var response = ""

    func updateView() -> Void  {
        // go to StringEntryController
    }
    
    func getTitle() -> String  {
        return title
    }

    func getText() -> String {
        return text
    }
    
    func getOptions() -> [String] {
        return options
    }
    
    func getResponse() -> [String] {
        return [response]
    }
}
