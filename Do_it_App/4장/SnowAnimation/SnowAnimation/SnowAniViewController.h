//
//  FireAniViewController.h
//  FireAnimation
//
//  Created by 소 영섭 on 11. 8. 31..
//  Copyright 2011년 home. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SnowAniViewController : UIViewController

{
    UIImageView *snowImageView;       // 움직이는 배경 이미지 뷰
    UIImage     *snowImage;           //눈 이미지
    
}

-(void)StartBackgroundAnimation:(float) Duration;     // 움직이는 배경효과 애니메이션 시작
-(void)StartSnowAnimation:(float) Duration;           // 눈 내라눈 효과 애니메이션 시작
-(void)animationTimerHandler:(NSTimer*)theTimer;      // 타이머 이벤트 핸들러

@end
