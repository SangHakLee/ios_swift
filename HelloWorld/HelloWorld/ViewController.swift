//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이상학 on 2015. 8. 11..
//  Copyright (c) 2015년 ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        pLabel.text = "Hello World"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

