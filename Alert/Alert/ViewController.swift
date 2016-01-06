//
//  ViewController.swift
//  Alert
//
//  Created by 이상학 on 2015. 9. 28..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttontapped(sender: AnyObject) {
        var alertView = UIAlertController(title: "너무 장시간 사용중입니다", message: "이제 스마트폰 대신 TV를 키세요", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertView.addAction(UIAlertAction(title: "앱으로 돌아가기", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertView, animated: true, completion: nil)
    }

}

