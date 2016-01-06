//
//  ViewController.m
//  AlarmApp
//
//  Created by 소영섭 on 2014. 8. 20..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"

@implementation ViewController
@synthesize infoButton;
@synthesize mainViewController;
@synthesize setupViewController;

            
- (void)viewDidLoad {
    MainViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    mainViewController =viewController;
    
    //infoButton 뒤로 MainViewController.view를 넣는다.
    [self.view insertSubview:viewController.view belowSubview:infoButton];
    [super viewDidLoad];
}




- (IBAction)setupClick {
    if (setupViewController == nil)
        setupViewController  = [self.storyboard     instantiateViewControllerWithIdentifier:@"SetupViewController"];

    
    [self presentViewController:setupViewController animated:YES completion:nil];
}

- (IBAction)closeClick
{
    [self AlarmSetting];
    [setupViewController dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) AlarmSetting
{
    
    mainViewController.pAlarmOnOff = setupViewController.switchControl.on;
    
    if (mainViewController.pAlarmOnOff == YES)
    {
        NSCalendar *pCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour| NSCalendarUnitMinute |NSCalendarUnitSecond;
        NSDate *date = [setupViewController.pDatePicker date];
        NSDateComponents *comps = [pCalendar components:unitFlags fromDate:date];
        mainViewController.pAlarmHour = (int)[comps hour];
        mainViewController.pAlarmMinute = (int)[comps minute];
        
    }
    
}


@end
