//
//  SnowAniViewController.h
//  SnowAnimation
//
//  Created by 이상학 on 2015. 8. 12..
//  Copyright (c) 2015년 ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnowAniViewController : UIViewController
{
    UIImageView *snowImageView; //움직이는 배경 이미지 뷰
    UIImageView *snowImage; // 눈 이미지
}

-(void) StartBackgroundAnimation:(float) Duration; // 움직이는 배경 애니메이션 시작
-(void) StartSnowAnimation:(float) Duration; // 눈 애니메이션 시작
-(void) animationTimerHandler:(NSTimer*)theTimer; //타이머 이벤트 핸들러

@end
