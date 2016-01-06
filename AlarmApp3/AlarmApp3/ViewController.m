//
//  ViewController.m
//  AlarmApp3
//
//  Created by 이상학 on 2015. 9. 1..
//  Copyright (c) 2015년 ryan. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize infoButton;
@synthesize mainViewController;

- (void)viewDidLoad { // 새로 정의
    MainViewController *viewController = [self.storyboard
                                          instantiateViewControllerWithIdentifier:@"MainViewController"];
    mainViewController = viewController; // 기존의 뷰말고 새로 만든 mainViewController  쓰는듯
    [self.view insertSubview:viewController.view belowSubview:infoButton]; // infoButton뒤로 mainViewController 넣음
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
