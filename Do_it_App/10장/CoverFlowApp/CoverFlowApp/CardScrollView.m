//
//  CardScrollView.m
//  SecretApp
//
//  Created by young soeb on 10. 12. 12..
//  Copyright 2010 home. All rights reserved.
//

#import "CardScrollView.h"


@implementation CardScrollView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
	

	
    return self;
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
	[self.superview touchesBegan:touches withEvent:event];
}



- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
	[self.superview touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
	
	[self.superview touchesEnded:touches withEvent:event];
	
}


@end
