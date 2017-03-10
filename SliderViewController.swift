//
//  SliderViewController.swift
//  Unigyde
//
//  Created by XCodeClub on 1/2/17.
//  Copyright © 2017 Unigyde. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    
    var testQuestion : SliderQuestion!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var menuShowing = false
    @IBAction func openMenu(_ sender: Any) {
        
        
        if (menuShowing) {
            leadingConstraint.constant = -140
        }
        else {
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            
        }
        menuShowing = !menuShowing    }
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let sliderValue = Int(sender.value)
        label.text = "\(sliderValue)"
        testQuestion.responses = ["\(sliderValue)"]
    }
   
    @IBAction func SliderButton(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
