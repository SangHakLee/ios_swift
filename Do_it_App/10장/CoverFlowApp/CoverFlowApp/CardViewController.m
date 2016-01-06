//
//  CardViewController.m
//  SecretApp
//
//  Created by young soeb on 10. 9. 6..
//  Copyright 2010 home. All rights reserved.
//

#import "CardViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation CardViewController

//@synthesize selectImage;

@synthesize  pCardIndex;
@synthesize  pRootViewController;
//@synthesize  scrollView;
@synthesize  menuUpButton;


- (void)viewDidLoad {
    [super viewDidLoad];
	CardViewOnOff = true;


	scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];  //스크롤뷰 생성
	

	[self SetCardImage];
	CGRect frame = self.view.frame;
	
    pSelectImageFirst = [[UIImageView alloc] initWithFrame:frame];
	pSelectImageFirst.contentMode = UIViewContentModeScaleAspectFit;
	pSelectImageFirst.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	pSelectImageFirst.userInteractionEnabled = YES;
    
    [pSelectImageFirst setImage:selectImage];      // 카드 이미지 설정
    
	scrollView.delegate = self;
	scrollView.contentSize = CGSizeMake(320, 480);
	scrollView.maximumZoomScale = 4;        // 최대 줌 배율을 설정합니다.
	scrollView.minimumZoomScale = 1;        // 최소 줌 배율을 설정합니다.
	scrollView.clipsToBounds = YES;
    [scrollView setUserInteractionEnabled:YES];
	[scrollView setZoomScale:scrollView.minimumZoomScale];
	
	[scrollView addSubview:pSelectImageFirst];
	[self.view insertSubview:scrollView belowSubview:menuUpButton];
    
    [self becomeFirstResponder];
    
 //--------   [selectImage release];
	selectImage = nil;

}



-(void) SetCardImage
{
	NSString *imageName;

	imageName = [[NSString alloc] initWithFormat:@"Body_%d.png", pCardIndex + 1];
	
	selectImage =  [UIImage imageNamed:imageName];

	
	NSLog(@"SetCardImage : %@", imageName);
	
}


@end
