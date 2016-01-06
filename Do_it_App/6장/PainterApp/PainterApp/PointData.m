//
//  PointData.m
//  PainterApp
//
//  Created by 소영섭 on 2014. 8. 11..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import "PointData.h"

@implementation PointData



@synthesize points;

- (id)init
{
    if (self = [super init])
    {
        points = [[NSMutableArray alloc] init]; // 최적화
    }
    
    return self;
}



- (void)addPoint:(CGPoint)point
{
    
    [points addObject:[NSValue valueWithCGPoint:point]];
}


@end
