//
//  MusicViewController.swift
//  Unigyde
//
//  Created by XCodeClub on 1/28/17.
//  Copyright © 2017 Unigyde. All rights reserved.
//

import UIKit
import AVFoundation

class MusicViewController: UIViewController {
    
    var musicPlayer: AVAudioPlayer = AVAudioPlayer()

    
    @IBAction func play(_ sender: Any) {
        musicPlayer.play()
    }
    
    
    @IBAction func stop(_ sender: Any) {
        musicPlayer.pause()
    }
    
    @IBAction func replay(_ sender: Any) {
        musicPlayer.currentTime = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let audio = Bundle.main.path(forResource: "beatles", ofType: "mp3")
        
        do {
        try musicPlayer = AVAudioPlayer(contentsOf: NSURL (fileURLWithPath: audio!) as URL)
        }
        catch {
        
        }
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
