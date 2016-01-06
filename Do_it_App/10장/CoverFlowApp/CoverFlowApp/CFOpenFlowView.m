
#import "CFOpenFlowView.h"
//#import "CFOpenFlowDefine.h"
#import "CFUIImageReflection.h"


@implementation CFOpenFlowView
@synthesize  viewDelegate, numberOfImages; //, defaultImage;

const static CGFloat kReflectionFraction = 0.85;

// 커버플로우 화면과 변수 및 객체를 초기화
- (void)setUpInit {
	
	cardImages = [[NSMutableDictionary alloc] init];

	pCovers = [[NSMutableDictionary alloc] init];
	
	scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
	scrollView.userInteractionEnabled = NO;
	scrollView.multipleTouchEnabled = NO;
	scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self addSubview:scrollView];
	
    // 관점을 설정합니다.
	CATransform3D sublayerTransform = CATransform3DIdentity;
	sublayerTransform.m34 = -0.01;
	[scrollView.layer setSublayerTransform:sublayerTransform];
	
	[self setBounds:self.frame];
    
	// 변수초기화.
	loVisibleCover = upVisibleCover = -1;
	selectedCoverView = nil;
	
	// 왼쪽 커버뷰를 위한 단위행렬
	leftTransform = CATransform3DIdentity;
	leftTransform = CATransform3DRotate(leftTransform, SIDE_COVER_ANGLE, 0.0f, 1.0f, 0.0f);
	// 오른쪽 커버뷰를 위한 단위행렬
    rightTransform = CATransform3DIdentity;
	rightTransform = CATransform3DRotate(rightTransform, SIDE_COVER_ANGLE, 0.0f, -1.0f, 0.0f);
	

}

- (CFItemView *)coverForIndex:(int)coverIndex {


  // ------  CFItemView *coverView = [[[CFItemView alloc] initWithFrame:CGRectZero] autorelease];
    CFItemView *coverView = [[CFItemView alloc] initWithFrame:CGRectZero];
	
	coverView.number = coverIndex;
	return coverView;
 }


- (void)updateCoverImage:(CFItemView *)aCover {
	NSNumber *coverNumber = [NSNumber numberWithInt:aCover.number];
	UIImage *coverImage = (UIImage *)[cardImages objectForKey:coverNumber];
	if (coverImage)
        [aCover setImage:coverImage  reflectionFraction:kReflectionFraction];
}

- (void)layoutCover:(CFItemView *)aCover selectedCover:(int)selectedIndex animated:(Boolean)animated  {
	int coverNum = aCover.number;
	CATransform3D newTransform;  // 4*4 행렬구조체
	CGFloat newZPosition = -20;
	CGPoint newPosition;
	
	newPosition.x = hWidth + aCover.hPosition;
	newPosition.y = hHeight + aCover.vPosition;
	if (coverNum < selectedIndex) {         // 선택된 커뷰의 왼쪽
		newPosition.x -= CENTER_COVER_OFFSET;
		newTransform = leftTransform;
	} else if (coverNum > selectedIndex) {  // 선택된 커버뷰의 오른쪽
		newPosition.x += CENTER_COVER_OFFSET;
		newTransform = rightTransform;
	} else {
		newZPosition = 0;
		newTransform = CATransform3DIdentity;     // 단위행렬 생성
	}
	
	if (animated) {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
		[UIView setAnimationBeginsFromCurrentState:YES];
	}
	
	aCover.layer.transform = newTransform;
	aCover.layer.zPosition = newZPosition;
	aCover.layer.position = newPosition;
	
	if (animated) {
		[UIView commitAnimations];
	}
}

- (void)layoutCovers:(int)selected fromCover:(int)lowerBound toCover:(int)upperBound {
	CFItemView *cover;
	NSNumber *coverNumber;
	for (int i = lowerBound; i <= upperBound; i++) {
		coverNumber = [[NSNumber alloc] initWithInt:i];
		cover = (CFItemView *)[pCovers objectForKey:coverNumber];
		// --------------[coverNumber release];
		[self layoutCover:cover selectedCover:selected animated:YES];
	}
}

- (CFItemView *)findCoverOnscreen:(CALayer *)targetLayer {
	// targetLayer가 커버중에 하나인지를 확인합니다.
	NSEnumerator *coverEnumerator = [pCovers objectEnumerator];
	CFItemView *aCover = nil;
	while (aCover = (CFItemView *)[coverEnumerator nextObject])
		if ([[aCover.pCardImageView layer] isEqual:targetLayer])
			break;
	
	return aCover;
}



- (void)awakeFromNib {
	[self setUpInit];
}

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self setUpInit];
	}
	
	return self;
}
/*
- (void)dealloc {
	//[defaultImage release];
	[scrollView release];
	
	[cardImages release];
	[pCovers removeAllObjects];
	[pCovers release];
	
	[super dealloc];
}
*/
- (void)setBounds:(CGRect)newSize {
	[super setBounds:newSize];
	
    // 커버플로우 화면의 중앙의 좌표를 구합니다.
	hWidth = self.bounds.size.width / 2;
	hHeight = self.bounds.size.height / 2;

     
	int lowerBound = MAX(-1, selectedCoverView.number - MAX_IMAGE_CNT);
	int upperBound = MIN(self.numberOfImages - 1, selectedCoverView.number + MAX_IMAGE_CNT);

	[self layoutCovers:selectedCoverView.number fromCover:lowerBound toCover:upperBound];
	[self centerOnSelectedCover:NO];
}

- (void)setNumberOfImages:(int)newNumberOfImages {
	
    numberOfImages = newNumberOfImages;
	scrollView.contentSize = CGSizeMake(newNumberOfImages * CARD_GAP + self.bounds.size.width, self.bounds.size.height);

    [self setSelectedCover:0];
	
	[self centerOnSelectedCover:NO];
  
}


- (void)setImage:(CFUIImageReflection *)image forIndex:(int)index {
	// 반사이미지를 만듭니다.
	UIImage *imageWithReflection = [image addImageReflection:kReflectionFraction];
	NSNumber *coverNumber = [NSNumber numberWithInt:index];
	[cardImages setObject:imageWithReflection forKey:coverNumber];

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint startPoint = [[touches anyObject] locationInView:self];
	isDraggingACover = NO;
	
	// 터치된 커버이미지를 찾습니다.
	CALayer *targetLayer = (CALayer *)[scrollView.layer hitTest:startPoint];
	CFItemView *targetCover = [self findCoverOnscreen:targetLayer];
	isDraggingACover = (targetCover != nil);

	startCover = selectedCoverView.number;
	startPosition = (startPoint.x / 1.5) + scrollView.contentOffset.x;
	
	if (isSingleTap)
		isDoubleTap = YES;
		
	isSingleTap = ([touches count] == 1);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	isSingleTap = NO;
	isDoubleTap = NO;
	
	// 사용자가 커버 이미지를 터치했을 때만 드래그합니다.
	if (!isDraggingACover)
		return;
	
	CGPoint movedPoint = [[touches anyObject] locationInView:self];
	CGFloat offset = startPosition - (movedPoint.x / 1.5);
	CGPoint newPoint = CGPointMake(offset, 0);
	scrollView.contentOffset = newPoint;
	int newCover = offset / CARD_GAP;
	if (newCover != selectedCoverView.number) {
		if (newCover < 0)
			[self setSelectedCover:0];
		else if (newCover >= self.numberOfImages)
			[self setSelectedCover:self.numberOfImages - 1];
		else
			[self setSelectedCover:newCover];
	}

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if (isSingleTap) {
		CGPoint targetPoint = [[touches anyObject] locationInView:self];
		CALayer *targetLayer = (CALayer *)[scrollView.layer hitTest:targetPoint];
		CFItemView *targetCover = [self findCoverOnscreen:targetLayer];
		if (targetCover && (targetCover.number != selectedCoverView.number))
			[self setSelectedCover:targetCover.number];
		else
			[self.viewDelegate openFlowView:self DidClicked:selectedCoverView.number XPoint:targetPoint.x YPoint:targetPoint.y];
			
	}
	[self centerOnSelectedCover:YES];
	
	if (startCover != selectedCoverView.number)
		if ([self.viewDelegate respondsToSelector:@selector(openFlowView:selectionDidChange:)])
			[self.viewDelegate openFlowView:self selectionDidChange:selectedCoverView.number];
}

- (void)centerOnSelectedCover:(BOOL)animated {
	CGPoint selectedOffset = CGPointMake(CARD_GAP * selectedCoverView.number, 0);
	[scrollView setContentOffset:selectedOffset animated:animated];
}


- (void)setSelectedCover:(int)newSelectedCover {
	if (selectedCoverView && (newSelectedCover == selectedCoverView.number))
		return;
	
	CFItemView *cover;
    
	int newLowerNum = MAX(0, newSelectedCover - MAX_IMAGE_CNT);
	int newUpperNum = MIN(self.numberOfImages - 1, newSelectedCover + MAX_IMAGE_CNT);
	
    
    if (!selectedCoverView) {
		// newLower에서 newUpper 범위에 포함된 커머비이지들을 배치합니다.
		for (int i=newLowerNum; i <= newUpperNum; i++) {
			cover = [self coverForIndex:i];
			[pCovers setObject:cover forKey:[NSNumber numberWithInt:i]];
			[self updateCoverImage:cover];
			[scrollView.layer addSublayer:cover.layer];
			[self layoutCover:cover selectedCover:newSelectedCover animated:NO];
		}
		
		loVisibleCover = newLowerNum;
		upVisibleCover = newUpperNum;
		selectedCoverView = (CFItemView *)[pCovers objectForKey:[NSNumber numberWithInt:newSelectedCover]];
		
		return;
	}
  
    if (selectedCoverView.number > newSelectedCover)
		[self layoutCovers:newSelectedCover fromCover:newSelectedCover toCover:selectedCoverView.number];
	else if (newSelectedCover > selectedCoverView.number)
		[self layoutCovers:newSelectedCover fromCover:selectedCoverView.number toCover:newSelectedCover];
	selectedCoverView = (CFItemView *)[pCovers objectForKey:[NSNumber numberWithInt:newSelectedCover]];
}

@end