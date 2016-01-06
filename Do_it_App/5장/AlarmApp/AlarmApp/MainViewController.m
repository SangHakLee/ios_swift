//
//  MainViewController.m
//  AlarmApp
//
//  Created by 소영섭 on 2014. 8. 20..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

//@synthesize  pAlarmOnOff;
//@synthesize  pAlarmHour;

//@synthesize  pAlarmMinute;


- (void)viewDidLoad
{
    
    [self onTimer];
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    [clockDisplay setFont:[UIFont fontWithName:@"DBLCDTempBlack" size:64.0]];
    
    //pAlarmOnOff = NO;
    
    [super viewDidLoad];
}



- (void)onTimer {
    int phour, pminute, psecond;
    
    NSCalendar *pCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour| NSCalendarUnitMinute |NSCalendarUnitSecond;
    
    
    NSDate *date = [NSDate date];
    NSDateComponents *comps = [pCalendar components:unitFlags fromDate:date];
    phour = (int)[comps hour];
    pminute = (int)[comps minute];
    psecond = (int)[comps second];
    clockDisplay.text = [NSString stringWithFormat:@"%02d:%02d:%02d",phour, pminute, psecond];
    
    pClockView.pHour = phour;
    pClockView.pMinute = pminute;
    pClockView.pSecond = psecond;
    
    [pClockView setNeedsDisplay];
    
    if (self.pAlarmOnOff == YES)
        if (self.pAlarmHour == phour && self.pAlarmMinute == pminute && psecond == 0)
            [self messageDisplay];
    
    
}




- (void)messageDisplay
{
    
    UIAlertView *AlrmView = [[UIAlertView alloc] initWithTitle:@"알람 시계"
                                                       message: @"약속시간입니다."
                                                      delegate:nil
                                             cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                             otherButtonTitles:nil];   
    [AlrmView show];   
    
}

@end
