//
//  ViewController.swift
//  Segment
//
//  Created by 이상학 on 2015. 10. 5..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ChangeLabel(sender: AnyObject) {
        if segment.selectedSegmentIndex == 0{
            label.text = "가요"
        }else if segment.selectedSegmentIndex == 1{
            label.text = "가요"
        }else if segment.selectedSegmentIndex == 2{
            label.text = "팝"
        }else if segment.selectedSegmentIndex == 3{
            label.text = "힙합"
        }else if segment.selectedSegmentIndex == 4{
            label.text = "일렉"
        }
    }

}

