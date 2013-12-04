#import "InfoButton.h"

@implementation InfoButton {
	UITableViewCell *my_cell;
	UIButton		*btn;
}
@synthesize key;
@synthesize tag;

+ (InfoButton *)createToSection:(InfoSection *)parent WithLabel:(NSString *)_key WithTag:(NSString *)_tag
{
	InfoButton *obj = [[InfoButton alloc] init];

	obj.key = _key;
	obj.tag = _tag;
	[parent.cells addObject:obj];
	return obj;
}

- (NSString *)getCellId
{
	return @"InfoButtonCell";
}

- (UITableViewCell *)create
{
	my_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self getCellId]];
	my_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return my_cell;
}

- (void)fill
{
	my_cell.textLabel.text = key;
}

- (CGFloat)getHeight
{
	return 44.0f;
}

- (NSString *)getTag
{
	return tag;
}

@end