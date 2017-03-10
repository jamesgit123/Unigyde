//
//  PickerViewController.swift
//  Unigyde
//
//  Created by XCodeClub on 1/3/17.
//  Copyright © 2017 Unigyde. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    @IBOutlet weak var layoutConstraint: NSLayoutConstraint!
    
    var menuShowing = false
    
    @IBAction func click(_ sender: Any) {
        if (menuShowing) {
            layoutConstraint.constant = -140
        }
        else {
            layoutConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            
        }
        menuShowing = !menuShowing      }

    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    let cities = ["Sydney","Melbourne", "Brisbane","Adelaide","Perth", "Canberra","Woolongong","Darwin", "Gold Coast", "Cairns"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = cities[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "Sydney"
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
