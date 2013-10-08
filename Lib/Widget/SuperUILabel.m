#import "SuperUILabel.h"

@implementation SuperUILabel

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];

	if (self) {
		self.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
	}

	return self;
}

- (void)drawTextInRect:(CGRect)rect
{
	[super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

@end