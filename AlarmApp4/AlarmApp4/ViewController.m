//
//  ViewController.m
//  AlarmApp4
//
//  Created by 이상학 on 2015. 9. 3..
//  Copyright (c) 2015년 ryan. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize infoButton;
@synthesize mainViewController;

- (void)viewDidLoad {
    MainViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    mainViewController = viewController;
    [self.view insertSubview:viewController.view belowSubview:infoButton];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
