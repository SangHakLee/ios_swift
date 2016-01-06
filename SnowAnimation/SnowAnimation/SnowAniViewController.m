//
//  SnowAniViewController.m
//  SnowAnimation
//
//  Created by 이상학 on 2015. 8. 12..
//  Copyright (c) 2015년 ryan. All rights reserved.
//

#import "SnowAniViewController.h"

@interface SnowAniViewController ()

@end

@implementation SnowAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self StartBackgroundAnimation:5]; // 움직이는 배경 효과 애니메이션 시작
    [self StartSnowAnimation:0.25]; // 눈이 내리는 효과 애니메에션
    // Do any additional setup after loading the view.
}

- (void) StartBackgroundAnimation:(float)Duration
{
    if(snowImageView == nil)
    {
        snowImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
        NSMutableArray *imageArray = [NSMutableArray array];
        for(int i = 1; i <= 46; i++)
            [imageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"snow-%d.tiff",i]]];
        snowImageView.animationImages = imageArray;
                         
    }else
    {
        [snowImageView removeFromSuperview];
    }
    snowImageView.animationDuration = Duration;
    snowImageView.animationRepeatCount = 0;
    [snowImageView startAnimating]; //애니메이션 시작
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
