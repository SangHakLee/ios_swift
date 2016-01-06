

#import <QuartzCore/QuartzCore.h>
#import "CFItemView.h"

@implementation CFItemView
@synthesize number, pCardImageView, hPosition, vPosition;

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {

		// Image View
		pCardImageView = [[UIImageView alloc] initWithFrame:frame];
		[self addSubview:pCardImageView];
	}
	
	return self;
}

- (void)setImage:(UIImage *)newImage  reflectionFraction:(CGFloat)reflectionFraction {
	[pCardImageView setImage:newImage];
	vPosition =  TOP_OFFSET + reflectionFraction / 2;
	self.frame = CGRectMake(0, 0, newImage.size.width, newImage.size.height);
}

- (void)setNumber:(int)newNumber {
	hPosition = CARD_GAP * newNumber;
	number = newNumber;
}

- (void)setFrame:(CGRect)newFrame {
	[super setFrame:newFrame];
	[pCardImageView setFrame:newFrame];
}


@end