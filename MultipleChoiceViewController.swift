//
//  MultipleChoiceViewController.swift
//  Unigyde
//
//  Created by XCodeClub on 12/28/16.
//  Copyright © 2016 Unigyde. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {
    
    
    @IBOutlet weak var layoutCovarraint: NSLayoutConstraint!
    
    var menuShowing = false
    @IBAction func menuClicked(_ sender: Any) {
        if (menuShowing) {
            layoutCovarraint.constant = -175
        }
        else {
            layoutCovarraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            
        }
        menuShowing = !menuShowing
        
        
    }

    //MARK: Properties
    let defaultColor = UIColor(red: 0xB8/255, green: 0xB8/255, blue: 0xB8/255, alpha:1.0)
    let highlightColor = UIColor.cyan
    
    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var buttonTL: UIButton!
    @IBOutlet weak var buttonTR: UIButton!
    @IBOutlet weak var buttonBL: UIButton!
    @IBOutlet weak var buttonBR: UIButton!
    
    var testQuestion : MultipleChoiceQuestion!
    
    func unselectAll(){
        buttonTL.backgroundColor = defaultColor
        buttonTR.backgroundColor = defaultColor
        buttonBL.backgroundColor = defaultColor
        buttonBR.backgroundColor = defaultColor
    }
    
    //MARK: Actions
    @IBAction func selectTL(_ sender: Any) {
        testQuestion.value = buttonTL.title(for: .normal)!
        unselectAll()
        buttonTL.backgroundColor = highlightColor
    }
    
    @IBAction func selectTR(_ sender: Any) {
        testQuestion.value = buttonTR.title(for: .normal)!
        unselectAll()
        buttonTR.backgroundColor = highlightColor
    }
    
    @IBAction func selectBL(_ sender: Any) {
        testQuestion.value = buttonBL.title(for: .normal)!
        unselectAll()
        buttonBL.backgroundColor = highlightColor
    }
    
    @IBAction func selectBR(_ sender: Any) {
        testQuestion.value = buttonBR.title(for: .normal)!
        unselectAll()
        buttonBR.backgroundColor = highlightColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? QuizNavigator
        destination?.question = testQuestion
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonTL.layer.cornerRadius = 10.0
        buttonTR.layer.cornerRadius = 10.0
        buttonBL.layer.cornerRadius = 10.0
        buttonBR.layer.cornerRadius = 10.0

        // Do any additional setup after loading the view, typically from a nib.
        testQuestion = MultipleChoiceQuestion(questionTitle: "Fight Me", questionText: "Which of the following is most appealing to you?", responses: ["Office Desk Job","Research in a lab","Physical Field Work","None appeal to me"], value:"")
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
