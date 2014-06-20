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

@end
