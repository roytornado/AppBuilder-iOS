#import "UIView+FrameUtil.h"

@implementation UIView (FrameUtil)

- (CGPoint)frameEndPoint {
	return CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y + self.frame.size.height);
}

- (CGFloat)width {
	return self.bounds.size.width;
}

- (CGFloat)height {
	return self.bounds.size.height;
}

- (void)setOrigin:(CGPoint)point {
	CGRect newFrame = self.frame;
	newFrame.origin = point;
	self.frame = newFrame;
}

- (void)setSize:(CGSize)size {
	CGRect newFrame = self.frame;
	newFrame.size = size;
	self.frame = newFrame;
}

- (void)centerX:(UIView*)parent {
	[self setOrigin:CGPointMake(parent.width / 2 - self.width / 2, self.frame.origin.y)];
}

- (void)centerY:(UIView*)parent {
	[self setOrigin:CGPointMake(self.frame.origin.x, parent.height / 2 - self.height / 2)];
}

- (void)addSubviewsFromStartV:(CGFloat)pad views:(NSArray*)views {
	CGFloat curY = 0;
	for(UIView* view in views){
		curY += pad;
		if(!view.superview){
			[view removeFromSuperview];
			[self addSubview:view];
		}
		[view setOrigin:CGPointMake(view.frame.origin.x, curY)];
		curY += view.frame.size.height;
	}
}

- (void)addSubviewsFromEndV:(CGFloat)pad views:(NSArray*)views {
	CGFloat curY = self.bounds.size.height;
	for(UIView* view in views){
		curY -= pad;
		curY -= view.frame.size.height;
		if(!view.superview){
			[view removeFromSuperview];
			[self addSubview:view];
		}
		[view setOrigin:CGPointMake(view.frame.origin.x, curY)];
	}
}

@end
