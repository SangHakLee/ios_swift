

#import <UIKit/UIKit.h>
#import "CFItemView.h"
#import <QuartzCore/QuartzCore.h>


@protocol CFOpenFlowViewDataSource;
@protocol CFOpenFlowViewDelegate;

@interface CFOpenFlowView : UIView {

	NSMutableDictionary				*pCovers;
	NSMutableDictionary				*cardImages;
    
	UIScrollView					*scrollView;
	int								loVisibleCover;
	int								upVisibleCover;
	int								numberOfImages;
	int								startCover;
	
	CFItemView						*selectedCoverView;

	CATransform3D leftTransform, rightTransform;
	
	CGFloat hHeight;
	CGFloat hWidth;
	
	Boolean isSingleTap;
	Boolean isDoubleTap;
	Boolean isDraggingACover;
	CGFloat startPosition;
}

@property (strong, nonatomic) IBOutlet id <CFOpenFlowViewDataSource> dataSource;
@property (strong, nonatomic) IBOutlet id <CFOpenFlowViewDelegate> viewDelegate;
@property (strong, nonatomic) UIImage *defaultImage;
@property int numberOfImages;

- (void)setUpInit;
- (CFItemView *)coverForIndex:(int)coverIndex;
- (void)updateCoverImage:(CFItemView *)aCover;
- (void)layoutCovers:(int)selected fromCover:(int)lowerBound toCover:(int)upperBound;
- (void)layoutCover:(CFItemView *)aCover selectedCover:(int)selectedIndex animated:(Boolean)animated;
- (CFItemView *)findCoverOnscreen:(CALayer *)targetLayer;

- (void)setSelectedCover:(int)newSelectedCover;
- (void)centerOnSelectedCover:(BOOL)animated;
- (void)setImage:(UIImage *)image forIndex:(int)index;



@end

@protocol CFOpenFlowViewDelegate <NSObject>
@optional
- (void)openFlowView:(CFOpenFlowView *)openFlowView selectionDidChange:(int)index;
- (void)openFlowView:(CFOpenFlowView *)openFlowView DidClicked:(int)index XPoint:(int) x YPoint:(int) y;
@end

@protocol CFOpenFlowViewDataSource <NSObject>
- (UIImage *)defaultImage;
@end
