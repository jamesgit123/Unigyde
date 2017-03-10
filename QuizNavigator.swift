//
//  QuizNavigator.swift
//  Unigyde
//
//  Created by XCodeClub on 1/11/17.
//  Copyright © 2017 Unigyde. All rights reserved.
//

import UIKit

class QuizNavigator: UINavigationController {
    
    var token: String = ""
    
    
    // get question
    var question : Question? = nil
    let testQuestion = MultipleChoiceQuestion(questionTitle: "test", questionText: "test", responses: ["1","2","3","4"], value:"")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let r = Just.get(
            "http://localhost:9000/survey/questions",
            data : ["token":token, "tier":1])
        
        if r.ok {
            print(r.json)
            if(token == ""){
                print("Invalid token!")
            }
        } else {
            print("ERROR IN HTTP!" + " \(r.statusCode)")
        }
        
        // set right view
        if (testQuestion is MultipleChoiceQuestion && testQuestion.getOptions().count == 4) {
            self.visibleViewController?.performSegue(withIdentifier: "toMultipleChoice", sender: nil)
        } else if(question is MultipleChoiceQuestion && testQuestion.getOptions().count == 2){
            self.visibleViewController?.performSegue(withIdentifier: "toYesNo", sender: nil)
        } else if(question is CheckboxQuestion){
            self.visibleViewController?.performSegue(withIdentifier: "toCheckbox", sender: nil)
        } else if(question is StringQuestion) {
            self.visibleViewController?.performSegue(withIdentifier: "toString", sender: nil)
        } else if(question is SliderQuestion) {
            self.visibleViewController?.performSegue(withIdentifier: "toSlider", sender: nil)
        } else {
            print("Question not detected")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (question != nil){
            let r = Just.post(
                "http://localhost:9000/survey/submit",
                data : ["token":token, "answers":[/*question id,*/ question?.getResponse()]])
            
            if r.ok {
                print(r.json)
                if(token == ""){
                    print("Invalid token!")
                }
            } else {
                print("ERROR IN HTTP!" + " \(r.statusCode)")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "toMultipleChoice") {
            let next = segue.destination as? MultipleChoiceViewController
            next?.testQuestion = testQuestion
        }
        
        if(segue.identifier == "toYesNo") {
            let next = segue.destination as? YesNoViewController
            next?.testQuestion = testQuestion
        }
        
        if(segue.identifier == "toCheckbox") {
            let next = segue.destination as? CheckboxQuestion
            //next?.testQuestion = testQuestion
        }
        
        if(segue.identifier == "toString") {
            let next = segue.destination as? StringEntryViewController
            //next?.testQuestion = testQuestion
        }
        
        if(segue.identifier == "toSlider") {
            let next = segue.destination as? SliderViewController
            //next?.testQuestion = testQuestion
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
