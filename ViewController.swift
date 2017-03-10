//
//  ViewController.swift
//  Unigyde
//
//  Created by XCodeClub on 12/20/16.
//  Copyright © 2016 Unigyde. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController , FBSDKLoginButtonDelegate, GIDSignInUIDelegate{

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var gbutton: GIDSignInButton!
    
    var token: String = ""
    
    @IBAction func signin(_ sender: Any) {
        let r = Just.post(
            "http://localhost:9000/auth/login",
            data: ["email":email.text, "password":password.text]
        )
        
        if r.ok {
            print(r.json)
            if let dictionary = r.json as? [String: Any] {
                if(dictionary["token"] as? String == ""){
                    // something went wrong
                } else {
                    token = (dictionary["token"] as? String)!
                    self.performSegue(withIdentifier: "loggedin", sender: nil)
                }
            }
        } else {
            print("ERROR IN HTTP!" + " \(r.statusCode)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "loggedin"){
            print("Begin message pass")
            let next = segue.destination.navigationController as? QuizNavigator
            next?.token = token
            if next == nil || next?.token == "" {
                print("Segue message passing failure!")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // empty for now
        setupFacebookButton()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signOut()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        GIDSignIn.sharedInstance().signOut()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // empty for now
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // empty for now
    }
    
    func setupFacebookButton() {
        let loginButton = FBSDKLoginButton()
        
        view.addSubview(loginButton)
        
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width-32,height: 50)
        
        loginButton.delegate = self
        loginButton.readPermissions = ["email","public_profile"]
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("You logged out of Facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        
        print("You are now logged into Facebook")
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            if (err != nil) {
                print ("Failed to start graph request:", err)
                return
                
            }
            
            print(result)
        }
    }
}

