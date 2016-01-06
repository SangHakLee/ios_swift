//
//  MainViewController.h
//  AlarmApp4
//
//  Created by 이상학 on 2015. 9. 3..
//  Copyright (c) 2015년 ryan. All rights reserved.
//
// 타이머를 이용해 시계가 작동할수 있게

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    NSString *timer; // 타이머 객체
    IBOutlet UILabel *clockDisplay; //디지털시계를 표현할 Label 참조 변수
}

-(void)onTimer; // 타이머 이벤트 핸들러

@end
