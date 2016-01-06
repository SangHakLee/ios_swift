//
//  PinterSetup.m
//  PainterApp
//
//  Created by 소  소영섭 on 12. 1. 30..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "PainterSetupViewController.h"

@implementation PainterSetupViewController


@synthesize delegate;


-(IBAction)ValueChange:(id)sender
{
    UIColor * tColor = [[UIColor alloc] initWithRed:[self.redBar value]
                                              green:[self.greenBar value]
                                               blue:[self.blueBar value]
                                              alpha:1];
    
    [self.colorPreView setBackgroundColor:tColor];
    
}


-(IBAction)PushBackClick
{
    
    UIColor * tColor = [[UIColor alloc] initWithRed:[self.redBar value]
                                              green:[self.greenBar value]
                                               blue:[self.blueBar value]
                                              alpha:1];
    
    [delegate painterSetupViewController:self setColor:tColor];
    [delegate painterSetupViewController:self setWidth:[self.widthBar value]];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}







@end
