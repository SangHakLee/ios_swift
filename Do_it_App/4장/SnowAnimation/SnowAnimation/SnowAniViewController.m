//
//  FireAniViewController.m
//  FireAnimation
//
//  Created by 소 영섭 on 11. 8. 31..
//  Copyright 2011년 home. All rights reserved.
//

#import "SnowAniViewController.h"

@implementation SnowAniViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self StartBackgroundAnimation:5];  // 움직이는 배경 효과 애니메이션 시작
    /*
        175 페이지에서 배경만 움직이는 애니메이션을 확인 할 경우에는 
        페이지 143페이지 8행인 [self StartSnowAnimation:0.25]; 
        삭제하고 실행하시면 됩니다. 
        StartSnowAnimation 메서드는 아직 구현전이라 실행중 오류발생합니다
     
        StartSnowAnimation 메서드는 175페이지에서 구현합니다.
     */
    [self StartSnowAnimation:0.25];       // 눈이 내리는 효과 애니메이션 시작
    
}


-(void)StartBackgroundAnimation:(float) Duration
{
    
    if(snowImageView == nil)
    {
        
        snowImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
        NSMutableArray *imageArray = [NSMutableArray  array];
        
        for(int i = 1; i <= 46; i++)
            [imageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"snow-%d.tiff", i]]];
        
        snowImageView.animationImages = imageArray;
        
    } else
    {
        [snowImageView removeFromSuperview];
        
    }
    //애니메이션 길이
    snowImageView.animationDuration = Duration;
    snowImageView.animationRepeatCount = 0;     // 반복횟수지정
    [snowImageView startAnimating];             // 에니메이션을 시작한다.
    [self.view addSubview:snowImageView];

 }


-(void)StartSnowAnimation:(float) Duration
{
    snowImage = [UIImage  imageNamed:@"snow.png"];   //눈이미지를 불러오기
    
    //타이머 설정
    [NSTimer scheduledTimerWithTimeInterval:(0.3) target:self selector:@selector   (animationTimerHandler:) userInfo:nil repeats:YES];
    
}




- (void) animationTimerHandler:(NSTimer*)theTimer
{
    UIImageView *snowView = [[UIImageView alloc] initWithImage:snowImage];
    
    
    int startX = round(random() % 320);
    int endX = round(random() % 320);
    double  snowSpeed = 10 + (random() % 10) / 10.0;
    
    snowView.alpha = 0.9;
    snowView.frame = CGRectMake(startX, -20, 20, 20);      // 시작 지점
    
    
    [UIView beginAnimations:nil context:(__bridge void *)(snowView)];    // 애니메이션 블럭 설정
    [UIView setAnimationDuration:snowSpeed];          // 애니메이션 속도
    
    snowView.frame = CGRectMake(endX, 568.0, 20, 20); // 최종 도착지점
    
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView setAnimationDelegate:self];
    [snowImageView addSubview:snowView];      // 이미지뷰 추가
    [UIView commitAnimations];                // 애니메이션 시작
    
}


- (void) animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    
    [(__bridge UIImageView *)context removeFromSuperview];
}



@end
