//
//  ViewController.swift
//  Timer
//
//  Created by 이상학 on 2015. 9. 28..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    var timerCount = 0 // 시간
    var timerRunning = false // 켜짐 꺼짐
    var timer = NSTimer()
    
    func Counting(){
        timerCount += 1
        label.text = "\(timerCount)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButton(sender: AnyObject) {
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "Counting", userInfo: nil, repeats: true)
            timerRunning = true
        }
    }

    @IBAction func stopButton(sender: AnyObject) {
        if timerRunning == true {
            timer.invalidate() // 타이머 꺼짐
            timerRunning = false
        }
    }
    
    @IBAction func restartButton(sender: AnyObject) {
        
        timerCount = 0 //타이머를 0으로
        label.text = "0"
    }
    
}

