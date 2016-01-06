//
//  MainBackView.m
//  SecretApp
//
//  Created by young soeb on 10. 9. 6..
//  Copyright 2010 home. All rights reserved.
//

#import "MainBackView.h"


@implementation MainBackView

@synthesize mode;

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	

	// 이미지를 읽어오는 다른 방법
    UIImage* img = [UIImage imageNamed:@"CardMain1.png"];
	imgRef = CGImageRetain(img.CGImage);
	
	
	return self;
}

- (void)drawRect:(CGRect)rect {
    //뷰의 그래픽스 컨텍스트를 구합니다.
	CGContextRef context = UIGraphicsGetCurrentContext();
	switch (mode) {
		case DEMO_BITMAP:      // 비트맵 이미지 배경화면
			[self drawBitmap:context];
			break;
		case DEMO_BEZIER:     // 태극 모양 배경화면
			[self drawBezier:context];
			break;
	}
}

- (void)dealloc {

	CGImageRelease(imgRef);

}


-(void) drawBitmap:(CGContextRef)context {
	// CTM의 이전 상태를 저장.
	CGContextSaveGState(context);
	// 현재좌표계의 원점을 이동합니다.
	CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    // 좌표의 방향과 비율을 설정합니다.
	CGContextScaleCTM(context, 1.0, -1.0);
	CGContextClipToRect(context, CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
	CGContextDrawImage(context,CGRectMake(0,0,CGImageGetWidth(imgRef), CGImageGetHeight(imgRef)), imgRef);

	CGContextRestoreGState(context);
}

-(void) drawBezier:(CGContextRef)context {
	// 선 두께
	CGContextSetLineWidth(context, 1.0);
	
	// 원 그리기 (상단)
    CGContextAddEllipseInRect(context,CGRectMake(0, 60, 320,320));
	CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
	CGContextDrawPath(context, kCGPathFillStroke);
	CGContextStrokePath(context);
	
	// 베지어 곡선 그리기
    CGContextMoveToPoint(context, 0.0, 220.0);
	CGContextAddCurveToPoint(context, 112.0, 330.0, 208.0, 50.0, 320.0, 220.0);
	CGContextSaveGState(context);
	
    // 반원 그리기 (하단)
	CGContextAddArc(context,160,220,160,0,M_PI,false);
	CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
	CGContextDrawPath(context, kCGPathFillStroke);
	CGContextStrokePath(context);
    
}


@end
