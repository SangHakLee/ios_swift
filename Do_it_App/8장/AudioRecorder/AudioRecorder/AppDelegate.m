//
//  AppDelegate.m
//  AudioRecorder
//
//  Created by 소영섭 on 2014. 9. 21..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    //상단 StatusBar를 안보이게 한다.
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    
    [self CopyOfDataBaseIfNeeded];
    
    return YES;
}






//번들에 있는 데이터베이스를 복사하는 메소드
- (BOOL) CopyOfDataBaseIfNeeded
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [paths objectAtIndex:0];
    
    NSString *myPath = [documentDirectory stringByAppendingPathComponent:@"RecordDB.sqlite"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL exist = [fileManager fileExistsAtPath:myPath];
    
    if (exist) {
        NSLog(@"DB가 존재합니다.");
        return TRUE;
    }
    
    //파일이 없으면 리소스 에서 파일을 복사한다
    
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"RecordDB.sqlite"];
    
    return [fileManager copyItemAtPath:defaultDBPath toPath:myPath error:nil];
    
}

@end
