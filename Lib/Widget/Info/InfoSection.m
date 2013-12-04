#import "InfoSection.h"
#import "InfoGroup.h"

@implementation InfoSection
@synthesize header;
@synthesize footer;
@synthesize cells;

- (id)init
{
	self = [super init];

	if (self) {
		cells = [NSMutableArray array];
	}

	return self;
}

+ (InfoSection *)createToGroup:(InfoGroup *)parent header:(NSString *)header footer:(NSString *)footer
{
	InfoSection *section = [[InfoSection alloc]init];

	[parent.sections addObject:section];
	section.header	= header;
	section.footer	= footer;
	return section;
}

@end