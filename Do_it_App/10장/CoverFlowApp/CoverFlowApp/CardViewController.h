//
//  CardViewController.h
//  SecretApp
//
//  Created by young soeb on 10. 9. 6..
//  Copyright 2010 home. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CommonModule.h"

@class ViewController;



@interface CardViewController : UIViewController <UIScrollViewDelegate>{

	UIImage *selectImage;
    UIScrollView *scrollView;
    //IBOutlet UIButton *menuUpButton;
	//RootViewController *pRootViewController;
	//int pCardIndex;
	UIImageView *pSelectImageFirst;
	Boolean	CardViewOnOff;
}


-(void) SetCardImage;


@property (weak, nonatomic) IBOutlet UIButton *menuUpButton;
@property (strong, nonatomic) ViewController *pRootViewController;
@property int pCardIndex;
@end
