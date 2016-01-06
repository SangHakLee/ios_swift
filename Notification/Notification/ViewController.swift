//
//  ViewController.swift
//  Notification
//
//  Created by 이상학 on 2015. 9. 28..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Timer = NSTimer()
    
    var Time = 5
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Notification"), userInfo: nil, repeats: true)
        
    }
    
    func Notification() {
        
        Time -= 1
        
        if(Time == 0){
            var Notification = UILocalNotification()
            
            Notification.alertAction = "앱으로 돌아가기"
            Notification.alertBody = "적이 침입해오고 있습니다"
            Notification.fireDate = NSDate(timeIntervalSinceNow: 0.1) // 0으로 놓으면 안뜸
            
            UIApplication.sharedApplication().scheduleLocalNotification(Notification)
            
            Timer.invalidate()
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

