//
//  MainViewController.m
//  AlarmApp4
//
//  Created by 이상학 on 2015. 9. 3..
//  Copyright (c) 2015년 ryan. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad { // viewDidLoad 메소드. NSTimer 이용해 타이머 설정. 주기적으로 작업을 반복할뿐 아니라 지정한 시간에도 타이머 이벤트 발생 가능
    [self onTimer]; // 타이머를 설정합니다.
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(onTimer) userInfo:nil repeats:YES]; // 현재 시간을 뷰에 표현할 폰트를 설정. 1초 마다 onTimer 실행
    [clockDisplay setFont:[UIFont fontWithName:@"DBLCDTempBlack" size:64.0]]; // 디지털 시간이 표현될 label의 폰트와 크기 설정
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)onTimer { // onTimer 메소드. 타이머의 이벤트가 발생했을 때 호출되는 콜백함수
    int phour, pminute, psecond;
    
    NSCalendar *pCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour |NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDate *date = [NSDate date]; // 현재 시간을 구한다.
    NSDateComponents *comps = [pCalendar components:unitFlags fromDate:date];
    phour = (int)[comps hour]; // 현재 시간 : 시
    pminute = (int)[comps minute]; // 현재시간 : 분
    psecond = (int)[comps second]; // 현재시간 : 초
    
    // 현재시간을 화면에 출력
    clockDisplay.text = [NSString stringWithFormat:@"%02d:%02d:%02d", phour, pminute, psecond];
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
