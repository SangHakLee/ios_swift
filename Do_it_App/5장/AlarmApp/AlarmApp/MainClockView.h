
#import <UIKit/UIKit.h>


@interface MainClockView : UIView {
	
	CGImageRef imgClock;
    
    
    int  pHour;
    int  pMinute;
    int  pSecond;
}


-(void) drawLine:(CGContextRef)context;
-(void) drawClockBitmap:(CGContextRef)context;
-(void) DrawSecond:(CGContextRef)context CenterX:(int)pCenterX  CenterY:(int)CenterY;
-(void) DrawMinute:(CGContextRef)context CenterX:(int)pCenterX  CenterY:(int)CenterY;
-(void) DrawHour:(CGContextRef)context CenterX:(int)pCenterX  CenterY:(int)CenterY;


@property  int pHour;
@property  int pMinute;
@property  int pSecond;

@end
