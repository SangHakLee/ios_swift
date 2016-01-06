//
//  ViewController.swift
//  Calculator
//
//  Created by 이상학 on 2015. 9. 28..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var screen: UILabel!
    var Method : Double = 0
    var SelectNumber : Double = 0
    var RunningTotal : Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberZero(sender: AnyObject) {
        SelectNumber = SelectNumber * 10
        SelectNumber = SelectNumber + 0
        screen.text = "\(SelectNumber)"
    }
    @IBAction func numberOne(sender: AnyObject) {
        SelectNumber = SelectNumber * 10
        SelectNumber = SelectNumber + 1
        screen.text = "\(SelectNumber)"
    }

    @IBAction func numberTwo(sender: AnyObject) {
        SelectNumber = SelectNumber * 10
        SelectNumber = SelectNumber + 2
        screen.text = "\(SelectNumber)"
    }
    
    @IBAction func numberThree(sender: AnyObject) {
        SelectNumber = SelectNumber * 10
        SelectNumber = SelectNumber + 3
        screen.text = "\(SelectNumber)"
    }
    @IBAction func numberFour(sender: AnyObject) {
        SelectNumber = SelectNumber * 10
        SelectNumber = SelectNumber + 4
        screen.text = "\(SelectNumber)"
    }
    @IBAction func numberFive(sender: AnyObject) {
        SelectNumber = SelectNumber * 10
        SelectNumber = SelectNumber + 5
        screen.text = "\(SelectNumber)"
    }
    @IBAction func numberSix(sender: AnyObject) {
        SelectNumber = SelectNumber * 10
        SelectNumber = SelectNumber + 6
        screen.text = "\(SelectNumber)"
    }
    @IBAction func numberSeven(sender: AnyObject) {
        SelectNumber = SelectNumber * 10
        SelectNumber = SelectNumber + 7
        screen.text = "\(SelectNumber)"
    }
    @IBAction func numberEight(sender: AnyObject) {
        SelectNumber = SelectNumber * 10
        SelectNumber = SelectNumber + 8
        screen.text = "\(SelectNumber)"
    }
    @IBAction func numberNine(sender: AnyObject) {
        SelectNumber = SelectNumber * 10
        SelectNumber = SelectNumber + 9
        screen.text = "\(SelectNumber)"
    }
    
    
    @IBAction func divide(sender: AnyObject) {
        if(RunningTotal == 0) {
            RunningTotal = SelectNumber
        }else{
            switch(Method){
            case 1 : RunningTotal = RunningTotal * SelectNumber
            break
                
            case 2 : RunningTotal = RunningTotal / SelectNumber
            break
            case 3 : RunningTotal = RunningTotal - SelectNumber
            break
            case 4 : RunningTotal = RunningTotal + RunningTotal
            break
                
            default :
            break
                
            }
            
        }
        Method = 2
        SelectNumber = 0 // 다른 계산을 하기 위해서
    }
    
    
    
    @IBAction func times(sender: AnyObject) {
        if(RunningTotal == 0) {
            RunningTotal = SelectNumber
        }else{
            switch(Method){
            case 1 : RunningTotal = RunningTotal * SelectNumber
                break
                
            case 2 : RunningTotal = RunningTotal / SelectNumber
                break
            case 3 : RunningTotal = RunningTotal - SelectNumber
                break
            case 4 : RunningTotal = RunningTotal + RunningTotal
                break
                
            default :
                break
                
            }
            
        }
        Method = 1
        SelectNumber = 0 // 다른 계산을 하기 위해서

    }
    
    
    
    @IBAction func subtract(sender: AnyObject) {
        if(RunningTotal == 0) {
            RunningTotal = SelectNumber
        }else{
            switch(Method){
            case 1 : RunningTotal = RunningTotal * SelectNumber
                break
                
            case 2 : RunningTotal = RunningTotal / SelectNumber
                break
            case 3 : RunningTotal = RunningTotal - SelectNumber
                break
            case 4 : RunningTotal = RunningTotal + RunningTotal
                break
                
            default :
                break
                
            }
            
        }
        Method = 3
        SelectNumber = 0 // 다른 계산을 하기 위해서

    }
    
    
    
    @IBAction func plus(sender: AnyObject) {
        if(RunningTotal == 0) {
            RunningTotal = SelectNumber
        }else{
            switch(Method){
            case 1 : RunningTotal = RunningTotal * SelectNumber
                break
                
            case 2 : RunningTotal = RunningTotal / SelectNumber
                break
            case 3 : RunningTotal = RunningTotal - SelectNumber
                break
            case 4 : RunningTotal = RunningTotal + RunningTotal
                break
                
            default :
                break
                
            }
            
        }
        Method = 4
        SelectNumber = 0 // 다른 계산을 하기 위해서
    }
    
    
    
    
    @IBAction func allClear(sender: AnyObject) {
        Method = 0
        RunningTotal = 0
        SelectNumber = 0
        screen.text = "0"
    }
    
    
    
    
    @IBAction func equal(sender: AnyObject) {
        if(RunningTotal == 0) {
            RunningTotal = SelectNumber
        }else{
            switch(Method){
            case 1 : RunningTotal = RunningTotal * SelectNumber
                break
                
            case 2 : RunningTotal = RunningTotal / SelectNumber
                break
            case 3 : RunningTotal = RunningTotal - SelectNumber
                break
            case 4 : RunningTotal = RunningTotal + RunningTotal
                break
                
            default :
                break
                
            }
            
        }
        Method = 0
        SelectNumber = RunningTotal
        screen.text = "\(SelectNumber)"

    }
    
    
}

