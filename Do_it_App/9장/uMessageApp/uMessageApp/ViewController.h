//
//  ViewController.h
//  uMessageApp
//
//  Created by 소영섭 on 2014. 9. 21..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MemberListViewController;
@class SetupViewController;

@interface ViewController : UITabBarController < UITabBarControllerDelegate>

-(void)LogIn:(NSString *)pUserID  PassWord:(NSString *)pPass;

@property (strong, nonatomic) MemberListViewController *pMemberListViewController;
@property (strong, nonatomic) SetupViewController      *pSetupViewController;
@property (strong, nonatomic) NSString      *UserID;
@end

