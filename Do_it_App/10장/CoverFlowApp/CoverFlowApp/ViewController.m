//
//  ViewController.m
//  CoverFlowApp
//
//  Created by 소영섭 on 2014. 9. 28..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

@synthesize pBottomToolbar;
@synthesize pBottomToolbarCard;
@synthesize pShareViewController;
@synthesize pCardViewController;
@synthesize pMainViewController;
@synthesize pAppInfoViewController;


//@synthesize timer;


- (void)viewDidLoad
{
    [self CreateCoverMakeViewController];
    [super viewDidLoad];
}


// 커버플로우 메인화면으로
- (void)CreateCoverMakeViewController
{
    
    MainViewController *viewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    
    [self.view addSubview:viewController.view];
    self.pMainViewController = viewController;
    self.pMainViewController.pRootViewController = self;
  //----------  [viewController release];
    
    pCurState = STATUS_MAINVIEW;   //Main View 설정
    
}



- (void)replaceSubview:(UIView *)oldView withSubview:(UIView *)newView transition:(NSString *)transition direction:(NSString *)direction duration:(NSTimeInterval)duration ToolBarView:(bool)ViewOption
{
    
    
    if ([oldView superview] == self.view) {
        [oldView removeFromSuperview];  //이전뷰를 제거한다
        if(ViewOption == false)
        {
            [self removeToolbarView];
        }
    }
    
    
    [self.view addSubview:newView];
    
    if(ViewOption == true)
    {
        
        [self.view insertSubview:pBottomToolbarCard aboveSubview:newView];
        [self.view insertSubview:pBottomToolbar aboveSubview:newView];
        
        
    }
    // 애니메이션
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    
    // 방향 선택
    [animation setType:transition];
    if (transition != kCATransitionFade) {
        [animation setSubtype:direction];
    }
    
    // 시간 및 타이밍 설정
    [animation setDuration:duration];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    [[self.view layer] addAnimation:animation forKey:nil];
    
}



//------------------------------------------------------
//Bottom ToolBar Controller Show
- (IBAction)BottonToolBarShow
{
    
    switch (pCurState) {
        case STATUS_MAINVIEW:
            [self ToolBarShowStart:1 theToolBarOnOff:true ];
            break;
        case STATUS_CARDVIEW:
            [self ToolBarShowStart:2 theToolBarOnOff:true ];
            break;
            
    };
}



//---------------------------------------------------------------------------
//ToolBar를 화면에 나타나게 한다
- (void)ToolBarShowStart:(int)theToolBarIndex theToolBarOnOff:(BOOL)ShowOnOff
{
    
    CGRect pframe;
    UIView *thisView = (UIView *)[self getCurView];
    
    if(timer != nil) return;
    
    
    ToolBarShowOnOff = ShowOnOff;
    ToolBarShowIndex = theToolBarIndex;
    
    switch (ToolBarShowIndex) {
        case 1:
            if(ToolBarShowOnOff == true) currentPoint = 480;
            else currentPoint = 436;
            pframe = CGRectMake(0.0, currentPoint, 320.0, 44.0);
            pBottomToolbar.frame = pframe;
            if(ToolBarShowOnOff == true)
                [self.view insertSubview:pBottomToolbar aboveSubview:thisView];
            
            
            timer = [NSTimer scheduledTimerWithTimeInterval:(0.01) target:self selector:@selector(timerToolBarShow:) userInfo:nil repeats:YES];
            break;
        case 2:
            if(ToolBarShowOnOff == true) currentPoint = 480;
            else currentPoint = 436;
            pframe = CGRectMake(0.0, currentPoint, 320.0, 44.0);
            pBottomToolbarCard.frame = pframe;
            if(ToolBarShowOnOff == true)
                [self.view insertSubview:pBottomToolbarCard aboveSubview:thisView];
            
            
            timer = [NSTimer scheduledTimerWithTimeInterval:(0.01) target:self selector:@selector(timerToolBarShow:) userInfo:nil repeats:YES];
            break;
            
    }
    
}

//---------------------------------------------
//툴바 화면에 애니메이션 형식으로 나오게 한다.
- (void)timerToolBarShow:(NSTimer*)theTimer
{
    
    CGRect pframe;
    
    switch (ToolBarShowIndex) {
        case 1:
            
            if(ToolBarShowOnOff == true) currentPoint -=  2;
            else currentPoint +=  2;
            pframe = CGRectMake(0.0, currentPoint, 320.0, 44.0);
            pBottomToolbar.frame = pframe;
            if(currentPoint == 436 || currentPoint == 480)
            {
                if(ToolBarShowOnOff == false)	[pBottomToolbar removeFromSuperview];
                [timer invalidate];
                timer = nil;
                
            }
            break;
        case 2:
            
            if(ToolBarShowOnOff == true) currentPoint -=  2;
            else currentPoint +=  2;
            pframe = CGRectMake(0.0, currentPoint, 320.0, 44.0);
            pBottomToolbarCard.frame = pframe;
            if(currentPoint == 436 || currentPoint == 480)
            {
                if(ToolBarShowOnOff == false)	[pBottomToolbarCard removeFromSuperview];
                [timer invalidate];
                timer = nil;
                
            }
            break;
            
    }
    
    
}

//-----------------------------
//ToolBar 를 없앴단.
- (void) removeToolbarView
{
    [pBottomToolbar removeFromSuperview];
    [pBottomToolbarCard removeFromSuperview];
    
}


//-------------------------------------------------
//객체를 삭제한다.
-(void) releaseController:(kStatusCode)pCurrentState
{
    
    switch (pCurrentState) {
            
        case STATUS_MAINVIEW:
   //---------         [pMainViewController release];
            pMainViewController = nil;
            break;
            
        case STATUS_CARDVIEW:
            pCardViewController = nil;
            break;
            
        case STATUS_APPINFO:
            pAppInfoViewController = nil;
            break;
            
    }
}



//---------------------------------------------------------------------------------
//현재상태의 view를 구하는 함수 ==> subviews의 정보를 이용해서 구하는 방식으로 변경
- (UIView *)getCurView
{
    switch (pCurState) {
        case STATUS_MAINVIEW:
            return self.pMainViewController.view;
            break;
        case STATUS_CARDVIEW:
            return self.pCardViewController.view;
            
        case STATUS_SHARE:
            return self.pShareViewController.view;
        case STATUS_APPINFO:
            return self.pAppInfoViewController.view;
        default:
            break;
    }
    return NULL;
    
    
}


//------------ 이벤트 함수들 -----------------
// 카드를 선택했을 경우 처리ㅣ
- (void)selectCard:(int)index
{
    
    [self removeToolbarView];
    
    pCardViewController = nil;
    pCardViewController = [[CardViewController alloc] initWithNibName:@"CardViewController" bundle:nil];
    pCardViewController.pRootViewController = self;
    
    self.pCardViewController.pCardIndex = index;
    
    switch (pCurState) {
        case STATUS_MAINVIEW:
            [self replaceSubview:pMainViewController.view withSubview:pCardViewController.view transition:kCATransitionFade direction:kCATransitionFromLeft duration:0.25 ToolBarView:false];
            
            
            break;
        case STATUS_SHARE:
            [self replaceSubview:pShareViewController.view withSubview:pCardViewController.view transition:kCATransitionFade direction:kCATransitionFromLeft duration:0.25 ToolBarView:false];
            [self releaseController:pCurState];
            break;
            
            
    }
    
    pCurState = STATUS_CARDVIEW;
    
}



//----------------------------------------------------------------
//Setup 버튼을 클릭하였을 경우
- (IBAction) setupToolBarClick
{
    
    [self ToolBarShowStart:1 theToolBarOnOff:false ];
    
    if (self.pAppInfoViewController == nil) {
        AppInfoViewController *viewController = [[AppInfoViewController alloc] initWithNibName:@"AppInfoViewController" bundle:nil];
        
        
        self.pAppInfoViewController = viewController;
        viewController.pRootViewController = self;
    //-----------    [viewController release];
    }
    
    [self replaceSubview:pMainViewController.view withSubview:pAppInfoViewController.view transition:kCATransitionFade direction:kCATransitionFromLeft duration:0.25 ToolBarView:false];
    
    pCurState = STATUS_APPINFO;   //AppInfoViewController
    
}


-(IBAction) backToolBarClick
{
    switch (pCurState) {
        case STATUS_SHARE:
            [self selectCard:pShareViewController.pSelectCardIndex];
            pCurState = STATUS_CARDVIEW;
            break;
            
        case STATUS_APPINFO:
            
            [self replaceSubview:pAppInfoViewController.view withSubview:pMainViewController.view transition:kCATransitionFade direction:kCATransitionFromLeft duration:0.25 ToolBarView:false];
            [self releaseController:pCurState]; //객체 삭제
            pCurState = STATUS_MAINVIEW;
            break;
            
        default:
            break;
    }
}

//-----------------------------------------
//Home 버튼을 클릭했을 경우 호출
-(IBAction) homeToolBarClick
{
    
    switch (pCurState) {
        case STATUS_CARDVIEW:
            
            [self replaceSubview:pCardViewController.view withSubview:pMainViewController.view transition:kCATransitionFade direction:kCATransitionFromLeft duration:0.25 ToolBarView:false];
            [self releaseController:pCurState];
            pCurState = STATUS_MAINVIEW;
            
            break;
            
        default:
            break;
    }
}



//-----------------------------------------
//공유 버튼을 클릭했을 경우 호출
- (IBAction)shareToolBarClick
{
    [self removeToolbarView];
    
    ShareViewController *viewController = [[ShareViewController alloc] initWithNibName:@"ShareViewController" bundle:nil];
    
    viewController.pRootViewController = self;
    self.pShareViewController = viewController;
    
 //---------   [viewController release];
    
    
    self.pShareViewController.pSelectCardIndex = self.pCardViewController.pCardIndex;
    
    [self replaceSubview:pCardViewController.view withSubview:pShareViewController.view transition:kCATransitionFade direction:kCATransitionFromLeft duration:0.25 ToolBarView:false];
    
    
    pCurState = STATUS_SHARE;
    
    
}

@end
