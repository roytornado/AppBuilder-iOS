#import "InfoGroup.h"

@implementation InfoGroup

@synthesize sections, table, delegate;

+ (InfoGroup *)createWithTable:(UITableView *)table
{
	InfoGroup *group = [[InfoGroup alloc] init];

	group.table			= table;
	table.dataSource	= group;
	table.delegate		= group;
	return group;
}

- (id)init
{
	self = [super init];

	if (self) {
		sections = [NSMutableArray array];
	}

	return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	InfoSection *info_section = [sections objectAtIndex:section];

	return [info_section.cells count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	InfoSection *info_section = [sections objectAtIndex:indexPath.section];

	id <InfoBase> info = (id <InfoBase>) [info_section.cells objectAtIndex : indexPath.row];
	return [info getHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	InfoSection *info_section = [sections objectAtIndex:indexPath.section];

	id <InfoBase>	info	= (id <InfoBase>) [info_section.cells objectAtIndex : indexPath.row];
	UITableViewCell *cell	= [info create];
	[info fill];
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	InfoSection *info_section = [sections objectAtIndex:section];

	if (info_section.header) {
		return info_section.header;
	}

	return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
	InfoSection *info_section = [sections objectAtIndex:section];

	if (info_section.footer) {
		return info_section.footer;
	}

	return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	NSString *headerText = [self tableView:tableView titleForHeaderInSection:section];

	if (!headerText) {
		return nil;
	}

	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
	tableView.sectionHeaderHeight = headerView.frame.size.height;
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, headerView.frame.size.width - 20, 22)];
	label.text				= headerText;
	label.font				= [UIFont boldSystemFontOfSize:18.0];
	label.backgroundColor	= [UIColor clearColor];
	label.textColor			= [UIColor blackColor];
	[headerView addSubview:label];
	return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
	NSString *footerText = [self tableView:tableView titleForFooterInSection:section];

	if (!footerText) {
		return nil;
	}

	UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
	tableView.sectionFooterHeight = footerView.frame.size.height;
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, footerView.frame.size.width - 20, 22)];
	label.text				= footerText;
	label.font				= [UIFont boldSystemFontOfSize:14.0];
	label.backgroundColor	= [UIColor clearColor];
	label.textColor			= [UIColor blackColor];
	[footerView addSubview:label];
	return footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	InfoSection *info_section = [sections objectAtIndex:indexPath.section];

	id <InfoBase> info = (id <InfoBase>) [info_section.cells objectAtIndex : indexPath.row];

	if ([info respondsToSelector:@selector(getTag)]) {
		NSString *tag = [info getTag];

		if (delegate && [delegate respondsToSelector:@selector(onClick:)]) {
			[delegate performSelector:@selector(onClick:) withObject:tag];
		}
	} else if ([info isKindOfClass:[InfoInputText class]]) {
		InfoInputText *input = (InfoInputText *)info;
		[input focus];
	}

	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end