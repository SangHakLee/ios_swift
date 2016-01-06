//
//  AppDelegate.m
//  uMessageApp
//
//  Created by 소영섭 on 2014. 9. 21..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //상단 StatusBar를 안보이게 한다.
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    
    
    return YES;
}


@end
