//
//  MainBackView.h
//  SecretApp
//
//  Created by young soeb on 10. 9. 6..
//  Copyright 2010 home. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum {
	DEMO_BITMAP=0,
	DEMO_BEZIER,
} kDemoMode;

@interface MainBackView : UIView {
	
	CGImageRef imgRef;
}
-(void) drawBitmap:(CGContextRef)context;
-(void) drawBezier:(CGContextRef)context;

@property (nonatomic, assign) kDemoMode mode;   // 배경이미지 유형
@end
