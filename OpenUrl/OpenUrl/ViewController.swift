//
//  ViewController.swift
//  OpenUrl
//
//  Created by 이상학 on 2015. 9. 25..
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

    @IBAction func openURL(sender: AnyObject) { // 3번 유부트 버튼 클리시 실행
        var thirdURL : NSURL = NSURL(string: "https://www.youtube.com/watch?v=Z7ttH0mk_xk")! // url 선언
        
        UIApplication.sharedApplication().openURL(thirdURL)// 실행
    }

}

