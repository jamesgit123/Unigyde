//
//  WebViewController.swift
//  Unigyde
//
//  Created by XCodeClub on 1/28/17.
//  Copyright © 2017 Unigyde. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var web: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let webview = URL(string: "https://www.youtube.com")
        web.loadRequest(URLRequest(url: webview!))
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
