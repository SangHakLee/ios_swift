
#import <UIKit/UIKit.h>


#define MAX_IMAGE_CNT      10
#define CARD_GAP 40
#define TOP_OFFSET 90
#define CENTER_COVER_OFFSET 70
#define SIDE_COVER_ANGLE .79

@interface CFItemView : UIView 

@property int number;
@property (nonatomic, readonly) CGFloat hPosition;
@property (nonatomic, readonly) CGFloat vPosition;
@property (nonatomic, readonly) UIImageView *pCardImageView;

- (void)setImage:(UIImage *)newImage  reflectionFraction:(CGFloat)reflectionFraction;

@end