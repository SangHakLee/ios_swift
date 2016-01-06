//
//  CoverMainFlowViewController.h
//  CoverFlowApp
//
//  Created by 소영섭 on 13. 6. 30..
//  Copyright (c) 2013년 소영섭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFOpenFlowView.h"             // CoverFlow
#import "MainBackView.h"


@class ViewController;


@interface MainViewController : UIViewController< CFOpenFlowViewDelegate, CFOpenFlowViewDataSource>
/*--------
{
    ViewController *pRootViewController;
    MainBackView *pMainBackView;         // 커버플로우 배경 View
}
*/
@property  int pSelectCardIndex;

@property (strong, nonatomic) ViewController *pRootViewController;
@property (weak, nonatomic) IBOutlet MainBackView *pMainBackView;


@end
