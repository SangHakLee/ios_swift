//
//  ViewController.swift
//  Vibration
//
//  Created by 이상학 on 2015. 9. 26..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: AnyObject) { // 진동 버튼 클릭하면 실해
        AudioServicesPlaySystemSound(4095)
        
    }

}

