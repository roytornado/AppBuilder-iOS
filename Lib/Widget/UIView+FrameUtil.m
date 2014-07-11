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

- (void)alignY:(UIView*)other {
	[self setOrigin:CGPointMake(self.frame.origin.x, other.frame.origin.y + other.height / 2 - self.height / 2)];
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
	if([self isKindOfClass:[UIScrollView class]]){
		UIScrollView* scrollView = (UIScrollView*)self;
		[scrollView setContentSize:CGSizeMake(320, curY)];
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

- (void)addSubviewsFromStartH:(CGFloat)pad views:(NSArray*)views {
	CGFloat curX = 0;
	for(UIView* view in views){
		curX += pad;
		if(!view.superview){
			[view removeFromSuperview];
			[self addSubview:view];
		}
		[view setOrigin:CGPointMake(curX, view.frame.origin.y)];
		curX += view.width;
	}
}

- (UIView*)wrapWithPadding:(UIEdgeInsets)padding {
	UIView* container = [[UIView alloc]initWithFrame:self.bounds];
	[container addSubview:self];
	self.frame = CGRectMake(padding.left, padding.top, self.width - padding.left - padding.right, self.height - padding.top - padding.bottom);
	return container;
}

@end
