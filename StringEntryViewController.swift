//
//  StringEntryViewController.swift
//  Unigyde
//
//  Created by XCodeClub on 12/28/16.
//  Copyright © 2016 Unigyde. All rights reserved.
//

import UIKit

class StringEntryViewController: UIViewController, UITextFieldDelegate {
    
    
    
    var testQuestion = MultipleChoiceQuestion(questionTitle: "Fight Me", questionText: "Please", responses: [], value:"")
    @IBOutlet weak var TitleText: UILabel!
    @IBOutlet weak var StringEntry: UITextField!
    @IBOutlet weak var EnterButton: UIButton!
    
    var temp: String = ""
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Button(_ sender: Any) {
        
        updateResponse()
        displayResponse()
    }
    
    func updateResponse() {
        testQuestion.value = temp
    }
    
    func displayResponse() {
        TitleText.text = testQuestion.value
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        StringEntry.delegate = self
        TitleText.text = "Example"
        
        updateQuestion(question: testQuestion)
    }

    
    func updateQuestion(question: MultipleChoiceQuestion) {
     
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        temp = StringEntry.text!
        StringEntry.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        temp = StringEntry.text!
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
