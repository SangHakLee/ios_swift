//
//  MainPainterView.h
//  PainterApp
//
//  Created by 소영섭 on 2014. 8. 11..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PointData.h"


@interface MainPainterView : UIView
{
    NSMutableArray *pPointArry;     // 모든 좌표 저장
    UIColor *pCurColor;             // 선의 색깔
    float    pCurWidth;             // 선의 두께
    TYPES    pCurType;              // 드로잉 타입
    
}

@property (nonatomic, retain) PointData *curPointData;

- (void)drawScreen:(PointData *)pData inContext:(CGContextRef)context;
- (void)drawPen:(PointData *)pData inContext:(CGContextRef)context;
- (void)drawLine:(PointData *)pData inContext:(CGContextRef)context;
- (void)drawCircle:(PointData *)pData inContext:(CGContextRef)context;
- (void)drawErase:(PointData *)pData inContext:(CGContextRef)context;
- (void)drawFillRectangle:(PointData *)pData inContext:(CGContextRef)context;

- (void) initCurPointData;


- (void)setpCurType:(TYPES)type;
- (void)setpCurColor:(UIColor * )color;
- (void)setpCurWidth:(float)width;

@end
