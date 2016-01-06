//
//  ViewController.h
//  AlarmApp4
//
//  Created by 이상학 on 2015. 9. 3..
//  Copyright (c) 2015년 ryan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (strong, nonatomic) MainViewController *mainViewController;
@end

