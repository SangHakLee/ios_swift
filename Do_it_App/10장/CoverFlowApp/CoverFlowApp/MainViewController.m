//
//  CoverMainFlowViewController.m
//  CoverFlowApp
//
//  Created by 소영섭 on 13. 6. 30..
//  Copyright (c) 2013년 소영섭. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"


@implementation MainViewController

@synthesize pRootViewController;
@synthesize pMainBackView;
@synthesize pSelectCardIndex;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    pMainBackView.mode = DEMO_BITMAP;

    [super viewDidLoad];
 
    NSString *imageName;
    
	
	for (int i=0; i < MAX_IMAGE_CNT; i++)
    {
		imageName = [[NSString alloc] initWithFormat:@"%d.png", i+1];
        
        UIImage *theImage = [UIImage imageNamed:imageName];
        [(CFOpenFlowView *)self.view setImage:theImage forIndex:i]  ;
        
       // [theImage release];
      //  [imageName release];
    }
    
    [(CFOpenFlowView *)self.view setNumberOfImages:MAX_IMAGE_CNT];
}


- (UIImage *)defaultImage {
	return nil; //[UIImage imageNamed:@"default.png"];
}


 
 - (void)openFlowView:(CFOpenFlowView *)openFlowView DidClicked:(int)index XPoint:(int) x YPoint:(int) y
 {
 
     if(y >= 120 && y <= 350 && x >= 85 && x < 235)	{
         pSelectCardIndex = index;
         [pRootViewController selectCard:index];
     
     }
     else
     {
         [pRootViewController ToolBarShowStart:1 theToolBarOnOff:false ];
 
     }
 
 }
 

 - (void)openFlowView:(CFOpenFlowView *)openFlowView DidChangeClicked:(int)index XPoint:(int) x YPoint:(int) y
 {
     
     NSLog(@"ChangeClicked.. %d", index);
 
 }

@end
