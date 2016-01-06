//
//  MainPainterView.m
//  PainterApp
//
//  Created by 소영섭 on 2014. 8. 11..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import "MainPainterView.h"

@implementation MainPainterView
@synthesize curPointData;



- (id)initWithCoder:(NSCoder*)decoder
{
    // if the superclass initializes properly
    if (self = [super initWithCoder:decoder])
    {
        
        pPointArry = [[NSMutableArray alloc] init];
        pCurColor = [UIColor blackColor];    // 디폴트 색상을 설정합니다.(black)
        pCurWidth = 2;                       // 디폴트 선의 투께를 설정합니다.(2)
        pCurType = PEN;                      // 디폴트 트로잉 Type를 설정합니다.(PEN)
        [self initCurPointData];
    }
    
    return self; // return this object
}


- (void) initCurPointData
{
    curPointData = [[PointData alloc] init];
    [curPointData setPColor:pCurColor];
    [curPointData setPWidth:pCurWidth];
    [curPointData setPType:pCurType];
    
}


- (void)setpCurType:(TYPES)type          // 드로잉 타입을 설정합니다.
{
    pCurType = type;
    [curPointData setPType:type];
    
}
- (void)setpCurColor:(UIColor *)color   // 선의 색상을 설정합니다.
{
    pCurColor = color;
    [curPointData setPColor:color];
    
}

- (void)setpCurWidth:(float)width       // 선의 굵기를 설정합니다.
{
    pCurWidth = width;
    [curPointData setPWidth:width];
    
}


- (void) addPointArry
{
    
    [pPointArry addObject:curPointData];
    
    [self initCurPointData];
}



- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();  // 그래픽 컨텍스트를 구합니다.
    
    for (PointData *pPoint in pPointArry) {
        [self drawScreen:pPoint inContext:context];
    }
    [self drawScreen:curPointData inContext:context];
    
    
}



- (void)drawScreen:(PointData *)pData inContext:(CGContextRef)context
{
    
    switch (pData.pType) {
        case PEN:
            [self drawPen:pData inContext:context];
            break;
        case LINE:
            [self drawLine:pData inContext:context];
            break;
        case CIRCLE:
            [self drawCircle:pData inContext:context];
            break;
        case RECTANGLE:
            [self drawFillRectangle:pData inContext:context];
            break;
        case ERASE:
            [self drawErase:pData inContext:context];
            break;
        default:
            break;
    }
    
}


- (void)drawPen:(PointData *)pData inContext:(CGContextRef)context
{
    CGColorRef colorRef = [pData.pColor CGColor];
    CGContextSetStrokeColorWithColor(context, colorRef);
    
    // 선이 굵기를 설정한다
    CGContextSetLineWidth(context, pData.pWidth);
    
    NSMutableArray *points = [pData points];
    
    if(points.count == 0) return;
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGPoint firstPoint; // declare a CGPoint
    [[points objectAtIndex:0] getValue:&firstPoint];
    
    // 시작점을 설정한다.
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    
    
    for (int i = 1; i < [points count]; i++)
    {
        NSValue *value = [points objectAtIndex:i];
        CGPoint point;
        [value getValue:&point];
        
        CGContextAddLineToPoint(context, point.x, point.y);
    }
    
    CGContextStrokePath(context);
    
    
    
}

- (void)drawLine:(PointData *)pData inContext:(CGContextRef)context
{
    
    CGColorRef colorRef = [pData.pColor CGColor];
    CGContextSetStrokeColorWithColor(context, colorRef);
    
    // 선이 굵기를 설정한다
    CGContextSetLineWidth(context, pData.pWidth);
    
    NSMutableArray *points = [pData points];
    
    if(points.count == 0) return;
    
    CGPoint firstPoint; // declare a CGPoint
    [[points objectAtIndex:0] getValue:&firstPoint];
    
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    // 시작점을 설정한다.
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    
    // 끝점을 설정한다.
    CGPoint lastPoint;
    [[points objectAtIndex:points.count  - 1] getValue:&lastPoint];
    CGContextAddLineToPoint(context, lastPoint.x, lastPoint.y);
    
    CGContextStrokePath(context);
}


- (void)drawCircle:(PointData *)pData inContext:(CGContextRef)context
{
    
    CGColorRef colorRef = [pData.pColor CGColor];
    CGContextSetStrokeColorWithColor(context, colorRef);
    
    // 선이 굵기를 설정한다
    CGContextSetLineWidth(context, pData.pWidth);
    
    NSMutableArray *points = [pData points];
    
    if(points.count == 0) return;
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    CGPoint firstPoint;
    [[points objectAtIndex:0] getValue:&firstPoint];
    
    // 끝점을 설정한다.
    CGPoint lastPoint;
    [[points objectAtIndex:points.count  - 1] getValue:&lastPoint];
    CGContextStrokeEllipseInRect(context, CGRectMake(firstPoint.x, firstPoint.y, (lastPoint.x - firstPoint.x), (
                                                                                                                lastPoint.y - firstPoint.y )));
    
    CGContextStrokePath(context);
}



- (void)drawErase:(PointData *)pData inContext:(CGContextRef)context
{
    
    // 선이 굵기를 설정한다
    CGContextSetLineWidth(context, 10);
    
    NSMutableArray *points = [pData points];
    
    if(points.count == 0) return;
    
    CGPoint firstPoint; // declare a CGPoint
    [[points objectAtIndex:0] getValue:&firstPoint];
    
    CGContextSetBlendMode(context, kCGBlendModeClear);
    
    // 시작점을 설정한다.
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    
    
    for (int i = 1; i < [points count]; i++)
    {
        NSValue *value = [points objectAtIndex:i];
        CGPoint point;
        [value getValue:&point];
        
        CGContextAddLineToPoint(context, point.x, point.y);
    }
    
    CGContextStrokePath(context);
}


- (void)drawFillRectangle:(PointData *)pData inContext:(CGContextRef)context
{
    CGColorRef colorRef = [pData.pColor CGColor];
    CGContextSetStrokeColorWithColor(context, colorRef);
    CGContextSetFillColorWithColor(context, colorRef);
    
    NSMutableArray *points = [pData points];
    
    if(points.count == 0) return;
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    CGPoint firstPoint;
    [[points objectAtIndex:0] getValue:&firstPoint];
    
    // 끝점을 설정한다.
    CGPoint lastPoint;
    [[points objectAtIndex:points.count  - 1] getValue:&lastPoint];
    CGContextFillRect(context, CGRectMake(firstPoint.x, firstPoint.y, (lastPoint.x - firstPoint.x), (
                                                                                                                lastPoint.y - firstPoint.y )));
    
    CGContextStrokePath(context);
    
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *array = [touches allObjects];
    
    
    for (UITouch *touch in array)
        [curPointData addPoint:[touch locationInView:self]];
    
    [self setNeedsDisplay];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *array = [touches allObjects];
    
    
    for (UITouch *touch in array)
        [curPointData addPoint:[touch locationInView:self]];
    
    [self setNeedsDisplay];
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *array = [touches allObjects];
    
    for (UITouch *touch in array)
        [curPointData addPoint:[touch locationInView:self]];
    
    [self addPointArry];
    [self setNeedsDisplay];
    
}

@end
