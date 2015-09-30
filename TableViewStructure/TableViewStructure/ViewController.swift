//
//  ViewController.swift
//  TableViewStructure
//
//  Created by 이상학 on 2015. 10. 1..
//  Copyright © 2015년 ryan. All rights reserved.
//

import Foundation
import UIKit

class ViewController : UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var FirstString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = FirstString
    }
}