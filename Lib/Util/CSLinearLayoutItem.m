#import "CSLinearLayoutItem.h"

@implementation CSLinearLayoutItem

@synthesize view				= _view;
@synthesize fillMode			= _fillMode;
@synthesize horizontalAlignment = _horizontalAlignment;
@synthesize verticalAlignment	= _verticalAlignment;
@synthesize padding				= _padding;
@synthesize tag			= _tag;
@synthesize userInfo	= _userInfo;

- (id)init
{
	self = [super init];

	if (self) {
		self.horizontalAlignment	= CSLinearLayoutItemHorizontalAlignmentLeft;
		self.verticalAlignment		= CSLinearLayoutItemVerticalAlignmentTop;
		self.fillMode				= CSLinearLayoutItemFillModeNormal;
	}

	return self;
}

- (id)initWithView:(UIView *)aView
{
	self = [super init];

	if (self) {
		self.view = aView;
		self.horizontalAlignment	= CSLinearLayoutItemHorizontalAlignmentLeft;
		self.verticalAlignment		= CSLinearLayoutItemVerticalAlignmentTop;
		self.fillMode				= CSLinearLayoutItemFillModeNormal;
	}

	return self;
}

+ (CSLinearLayoutItem *)layoutItemForView:(UIView *)aView
{
	CSLinearLayoutItem *item = [[CSLinearLayoutItem alloc] initWithView:aView];

	return item;
}

- (void)dealloc
{
	self.view		= nil;
	self.userInfo	= nil;
}

CSLinearLayoutItemPadding CSLinearLayoutMakePadding(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
{
	CSLinearLayoutItemPadding padding;

	padding.top		= top;
	padding.left	= left;
	padding.bottom	= bottom;
	padding.right	= right;

	return padding;
}

@end