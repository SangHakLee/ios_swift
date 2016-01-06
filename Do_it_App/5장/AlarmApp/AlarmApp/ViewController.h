//
//  ViewController.h
//  AlarmApp
//
//  Created by 소영섭 on 2014. 8. 20..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "SetupViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (strong, nonatomic) MainViewController *mainViewController;
@property (strong, nonatomic) SetupViewController *setupViewController;


- (IBAction)setupClick;
- (IBAction)closeClick;
- (void) AlarmSetting;


@end

