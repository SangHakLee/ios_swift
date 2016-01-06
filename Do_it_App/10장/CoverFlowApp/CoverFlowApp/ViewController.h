//
//  ViewController.h
//  CoverFlowApp
//
//  Created by 소영섭 on 2014. 9. 28..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/NSDate.h>
#import "MainViewController.h"
#import "CardViewController.h"
#import "ShareViewController.h"
#import "AppInfoViewController.h"


typedef enum {
    STATUS_DEFAULT=0,
    STATUS_MAINVIEW,        //커버 플로우 메인화면
    STATUS_CARDVIEW,        //선택된 단일카드 View화면
    STATUS_SHARE,           //공유메뉴 선택화면
    STATUS_APPINFO          // 앱정보 화면
} kStatusCode;



@interface ViewController : UIViewController
{

    kStatusCode pCurState;   //1 : MainView  2:CardView
    bool ToolBarShowOnOff;    //툴바롤 보여주는 애니메이션 여부
    int  ToolBarShowIndex;    //
    NSTimer *timer;
    int  currentPoint;
}

@property (strong, nonatomic) MainViewController *pMainViewController;
@property (strong, nonatomic) CardViewController *pCardViewController;
@property (strong, nonatomic) ShareViewController *pShareViewController;
@property (strong, nonatomic) AppInfoViewController *pAppInfoViewController;

@property (weak, nonatomic) IBOutlet UIToolbar *pBottomToolbar;
@property (weak, nonatomic) IBOutlet UIToolbar *pBottomToolbarCard;


- (void)replaceSubview:(UIView *)oldView withSubview:(UIView *)newView transition:(NSString *)transition direction:(NSString *)direction duration:(NSTimeInterval)duration ToolBarView:(bool)ViewOption;
- (void)removeToolbarView;
- (void)ToolBarShowStart:(int)theToolBarIndex theToolBarOnOff:(BOOL)ShowOnOff;
- (void)selectCard:(int)index;

- (IBAction)BottonToolBarShow;
- (IBAction)backToolBarClick;
- (IBAction)homeToolBarClick;    // Home Button Click
- (IBAction)shareToolBarClick;    // 공유 Button Click
- (IBAction)setupToolBarClick;    // 설정 button Click

@end

