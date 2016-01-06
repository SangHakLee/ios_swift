//
//  ViewController.swift
//  clientregistry
//
//  Created by 이상학 on 2015. 9. 17..
//  Copyright (c) 2015년 ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emailField:UITextField!
    @IBOutlet var nameField:UITextField!
    
    @IBAction func confirm(){
        var 이메일 = emailField.text
        var 이름 = nameField.text
        println("confirmed!1 \(이름) \(이메일)")
    }

}

