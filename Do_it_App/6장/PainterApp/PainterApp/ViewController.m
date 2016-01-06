//
//  ViewController.m
//  PainterApp
//
//  Created by 소영섭 on 2014. 8. 11..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController



- (void)viewDidLoad
{

    [super viewDidLoad];
}


-(IBAction)PenClick         //  Pen Type
{
    [(MainPainterView *)self.view setpCurType:PEN];
    
}
-(IBAction)LineClick       // Line Type
{
    [(MainPainterView *)self.view setpCurType:LINE];
}

-(IBAction)CircleClick     // Circle Type
{
    [(MainPainterView *)self.view setpCurType:CIRCLE];
    
}

-(IBAction)EraseClick     // Erase Type
{
    [(MainPainterView *)self.view setpCurType:ERASE];
    
}

-(IBAction)RectangleClick     // Taegeuk Type
{
    [(MainPainterView *)self.view setpCurType:RECTANGLE];
    
}



-(IBAction)SetupClick
{
    if (pPainterSetupViewController == nil) {
            
        PainterSetupViewController *viewController = [self.storyboard     instantiateViewControllerWithIdentifier:@"PainterSetupViewController"];
        
        viewController.delegate = self;
        pPainterSetupViewController = viewController;
    }
    [self presentViewController:pPainterSetupViewController animated:YES completion:nil];
    
}


// PainterSetupViewDelegate 델리게이트 구현함수(색상설정)
- (void)painterSetupViewController:(PainterSetupViewController *) controller setColor:(UIColor *)color
{
    [(MainPainterView *) self.view setpCurColor:color];
}

// PainterSetupViewDelegate 델리게이트 구현함수(선의두께 설정)
- (void)painterSetupViewController:(PainterSetupViewController *) controller setWidth:(float)width
{
    [(MainPainterView *) self.view setpCurWidth:width];
}



@end
