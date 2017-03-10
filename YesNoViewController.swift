//
//  YesNoViewController.swift
//  Unigyde
//
//  Created by XCodeClub on 1/3/17.
//  Copyright © 2017 Unigyde. All rights reserved.
//

import Foundation

import UIKit

class YesNoViewController: UIViewController {
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var nobutton: UIButton!
    
    var testQuestion : MultipleChoiceQuestion = MultipleChoiceQuestion(questionTitle: "Fight Me", questionText: "Do you see yourself working in a hospital?", responses: ["yes", "no"], value:"")
    
    @IBAction func yesAction(_ sender: Any) {
        
    }
    
    @IBAction func noAction(_ sender: Any) {
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        updateQuestion()
    }
    
    func updateQuestion(){
        questionText.text = testQuestion.questionText
    }
}
