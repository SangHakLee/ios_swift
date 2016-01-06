//
//  PointData.h
//  PainterApp
//
//  Created by 소영섭 on 2014. 8. 11..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>    // 필히 추가

typedef enum {
    PEN = 0,
    LINE = 1,
    CIRCLE = 2,
    RECTANGLE = 3,
    ERASE = 4
} TYPES;

@interface PointData : NSObject


@property (strong, nonatomic) UIColor* pColor;
@property float pWidth;
@property TYPES pType;
@property (readonly, nonatomic) NSMutableArray *points;

- (void)addPoint:(CGPoint)point;



@end
