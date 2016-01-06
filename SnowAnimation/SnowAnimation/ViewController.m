//
//  ViewController.m
//  SnowAnimation
//
//  Created by 이상학 on 2015. 8. 11..
//  Copyright (c) 2015년 ryan. All rights reserved.
//

#import "ViewController.h"
#import "SnowAniViewController.h" // 내가 만든 헤더 추가

@interface ViewController ()

@end

@implementation ViewController
@synthesize infoButton;

- (void)viewDidLoad {

SnowAniViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SnowAniViewController"];
    [self.view insertSubview:viewController.view belowSubview:infoButton];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
