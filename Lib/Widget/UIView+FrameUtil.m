#import "UIView+FrameUtil.h"

@implementation UIView (FrameUtil)

- (CGPoint)frameEndPoint {
	return CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y + self.frame.size.height);
}

@end
