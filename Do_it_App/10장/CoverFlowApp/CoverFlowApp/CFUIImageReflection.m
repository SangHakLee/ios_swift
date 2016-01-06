
#import "CFUIImageReflection.h"


@implementation UIImage (AFUIImageReflection)

- (UIImage *)addImageReflection:(CGFloat)reflectionFraction {
	
    int rHeight = self.size.height * reflectionFraction;

	CGImageRef gMaskImage = NULL;
	
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    // 바트맵 컨택스트를 생성합니다.
    CGContextRef gBitmapContext = CGBitmapContextCreate(nil, 1,rHeight,                                                           8, 0, colorSpace, kCGImageAlphaNone);
    
    // 그레이 스케일의 시작과 끝의 값을 정의합니다.
    CGFloat colors[] = {0.0, 1.0, 1.0, 1.0};
    
    // CGGradient를 생성하고 color space는 해제합니다.
    CGGradientRef grayScaleGradient = CGGradientCreateWithColorComponents(colorSpace, colors, NULL, 2);
    CGColorSpaceRelease(colorSpace);
    
    // gradient vector의 시작과 끝 지접을 지정하고 그레이 비트맵 콘텐츠의 그라데이션을 그립니다.
    CGContextDrawLinearGradient(gBitmapContext, grayScaleGradient, CGPointMake(0, rHeight),
                                CGPointZero, kCGGradientDrawsAfterEndLocation);
	CGGradientRelease(grayScaleGradient);
    
	//50% 불투명도로 검은색을 채웁니다.
	CGContextSetGrayFillColor(gBitmapContext, 0.0, 0.5);
	CGContextFillRect(gBitmapContext, CGRectMake(0, 0, 1, rHeight));
    
    gMaskImage = CGBitmapContextCreateImage(gBitmapContext);
    CGContextRelease(gBitmapContext);
	
    CGImageRef rImage = CGImageCreateWithMask(self.CGImage, gMaskImage);
    CGImageRelease(gMaskImage);
	
	CGSize size = CGSizeMake(self.size.width, self.size.height + rHeight);
	
	UIGraphicsBeginImageContext(size);
	
	[self drawAtPoint:CGPointZero];
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextDrawImage(context, CGRectMake(0, self.size.height, self.size.width, rHeight), rImage);
	
	UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    CGImageRelease(rImage);
	
	return result;

}

@end