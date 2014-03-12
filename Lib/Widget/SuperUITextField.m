#import "SuperUITextField.h"

@implementation SuperUITextField
@synthesize padding;

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		padding = 10;
	}
	return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
	return CGRectInset(bounds, padding, padding);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
	return CGRectInset(bounds, padding, padding);
}

@end
