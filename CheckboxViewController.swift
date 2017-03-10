//
//  MultipleChoiceViewController.swift
//  Unigyde
//
//  Created by XCodeClub on 12/28/16.
//  Copyright © 2016 Unigyde. All rights reserved.
//

import UIKit

class CheckboxViewController: UIViewController {
    
    //MARK: Properties
    let defaultColor = UIColor(red: 0xB8/255, green: 0xB8/255, blue: 0xB8/255, alpha:1.0)
    let highlightColor = UIColor.cyan
    
    @IBOutlet weak var questionText: UITextField!
    
    
    var selectedTL = false
    var selectedTR = false
    var selectedBL = false
    var selectedBR = false
    
    var testQuestion : CheckboxQuestion!
    
    @IBOutlet weak var buttonTL: UIButton!
    @IBOutlet weak var buttonTR: UIButton!
    @IBOutlet weak var buttonBL: UIButton!
    @IBOutlet weak var buttonBR: UIButton!
    
    @IBAction func selectTL(_ sender: Any) {
        if(selectedTL){
            selectedTL = false
            buttonTL.backgroundColor = defaultColor
            testQuestion.responses[0] = ""
        } else {
            selectedTL = true
            buttonTL.backgroundColor = highlightColor
            testQuestion.responses[0] = testQuestion.options[0]
        }
    }
    
    @IBAction func selectTR(_ sender: Any) {
        if(selectedTR){
            selectedTR = false
            buttonTR.backgroundColor = defaultColor
            testQuestion.responses[1] = ""
        } else {
            selectedTR = true
            buttonTR.backgroundColor = highlightColor
            testQuestion.responses[1] = testQuestion.options[1]
        }
    }
    
    @IBAction func selectBL(_ sender: Any) {
        if(selectedBL){
            selectedBL = false
            buttonBL.backgroundColor = defaultColor
            testQuestion.responses[2] = ""
        } else {
            selectedBL = true
            buttonBL.backgroundColor = highlightColor
            testQuestion.responses[2] = testQuestion.options[2]
        }
    }
    
    @IBAction func selectBR(_ sender: Any) {
        if(selectedTL){
            selectedTL = false
            buttonBR.backgroundColor = defaultColor
            testQuestion.responses[3] = ""
        } else {
            selectedTL = true
            buttonBR.backgroundColor = highlightColor
            testQuestion.responses[3] = testQuestion.options[3]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonTL.layer.cornerRadius = 10.0
        buttonTR.layer.cornerRadius = 10.0
        buttonBL.layer.cornerRadius = 10.0
        buttonBR.layer.cornerRadius = 10.0
        
        // Do any additional setup after loading the view, typically from a nib.
        testQuestion = CheckboxQuestion(questionTitle: "Fight Me", questionText: "Which of the following is most appealing to you?", options: ["Office Desk Job","Research in a lab","Physical Field Work","None appeal to me"], responses:["","","",""])
        updateQuestion()
    }
    
    func updateQuestion(){
        
        questionText.text = testQuestion.getText()
        buttonTL.setTitle(testQuestion.getOptions()[0], for: .normal)
        buttonTR.setTitle(testQuestion.getOptions()[1], for: .normal)
        buttonBL.setTitle(testQuestion.getOptions()[2], for: .normal)
        buttonBR.setTitle(testQuestion.getOptions()[3], for: .normal)
        
        /**
         let master = UIStackView()
         master.axis = .vertical
         master.distribution = .fillEqually
         master.alignment = .fill
         master.spacing = 5
         master.translatesAutoresizingMaskIntoConstraints = false
         master.isHidden = false
         master.heightAnchor.constraint(equalToConstant: 400.0).isActive = true
         master.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
         view.addSubview(master)
         
         questionTitle.text = question.getTitle()
         
         var stackedPairs : [UIStackView] = []
         let reqStacks = Int(ceil(Double(question.getOptions().count) / 2))
         
         for _ in 1...reqStacks {
         let pair = UIStackView()
         pair.axis = .horizontal
         pair.distribution = .fillEqually
         pair.alignment = .fill
         pair.spacing = 5
         pair.translatesAutoresizingMaskIntoConstraints = false
         pair.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
         pair.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
         pair.isHidden = false
         stackedPairs.append(pair)
         }
         
         for stack in stackedPairs{
         master.addArrangedSubview(stack)
         }
         
         var x = 0;
         for resp in question.responses {
         let curr = UIButton()
         curr.setTitle(resp, for: .normal)
         curr.backgroundColor = UIColor(red: 0xC0, green: 0xC0, blue: 0xC0, alpha: 0.0)
         curr.setTitleColor(UIColor(red: 0xC0, green: 0xC0, blue: 0xC0, alpha: 0.0), for: .normal)
         let stack = Int(floor(Double(x) / 2.0))
         stackedPairs[stack].addArrangedSubview(curr)
         x += 1
         } **/
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
