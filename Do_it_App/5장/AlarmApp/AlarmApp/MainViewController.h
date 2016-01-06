//
//  MainViewController.h
//  AlarmApp
//
//  Created by 소영섭 on 2014. 8. 20..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainClockView.h"

@interface MainViewController : UIViewController
{
    NSTimer *timer;
    
    IBOutlet UILabel *clockDisplay;
    IBOutlet MainClockView *pClockView;
    
}

-(void)onTimer;
@property  Boolean pAlarmOnOff;
@property  int pAlarmHour;
@property  int pAlarmMinute;

@end
