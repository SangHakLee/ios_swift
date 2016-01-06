//
//  ViewController.m
//  SnowAnimation
//
//  Created by 소영섭 on 2014. 7. 29..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import "ViewController.h"
#import "SnowAniViewController.h"


@implementation ViewController

@synthesize infoButton;
- (void)viewDidLoad {
    
     SnowAniViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SnowAniViewController"];

    
    //infoButton 뒤로 RecordViewController.view를 넣는다.
    [self.view insertSubview:viewController.view belowSubview:infoButton];
    [super viewDidLoad];
    
}

/*

-(IBAction)PushBackClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(IBAction)PushSetupClick
{
    
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SnowInfoViewController"];
    
    [self presentViewController:viewController animated:YES completion:nil];
    
}
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
