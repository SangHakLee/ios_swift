//
//  ViewController.swift
//  passingData
//
//  Created by 이상학 on 2015. 9. 25..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        var DestViewController : ViewTwo = segue.destinationViewController as! ViewTwo
        
        
        DestViewController.labelText = textField.text!
    }


}

