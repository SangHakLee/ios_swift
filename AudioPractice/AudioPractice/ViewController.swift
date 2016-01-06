//
//  ViewController.swift
//  AudioPractice
//
//  Created by 이상학 on 2015. 10. 7..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    var audio = AVAudioPlayer(contentsOfURL: <#T##NSURL#>)
//    var audio = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("download", ofType: "mp4")!), error : nil)
    var audio = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("download", ofType: "mp4")!), fileTypeHint: nil)

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audio.play()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playTapped(sender: AnyObject) {
        if(audio.playing == true){
            audio.stop()
            button.setTitle("play", forState: UIControlState.Normal) // 버튼을 변경
        }else{
            audio.play()
            button.setTitle("pause", forState: UIControlState.Normal)
        }
    }

    @IBAction func restartTapped(sender: AnyObject) {
    }

    @IBOutlet var stopTapped: [NSLayoutConstraint]!
}

