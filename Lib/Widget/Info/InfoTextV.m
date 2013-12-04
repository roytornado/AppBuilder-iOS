#import "InfoTextV.h"

@implementation InfoTextV {
    UITableViewCell *my_cell;
}
@synthesize key, value;

+ (InfoTextV *)createToSection:(InfoSection *)parent WithKey:(NSString *)_key WithValue:(NSString *)_value
{
    InfoTextV *obj = [[InfoTextV alloc] init];

    obj.key = _key;
    obj.value = _value;

    [parent.cells addObject:obj];
    return obj;
}

- (NSString *)getCellId
{
    return @"InfoTextVCell";
}

- (UITableViewCell *)create
{
    my_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[self getCellId]];

    return my_cell;
}

- (void)fill
{
    my_cell.textLabel.text = key;
    my_cell.detailTextLabel.text = value;
}

- (CGFloat)getHeight
{
    CGFloat CELL_CONTENT_MARGIN = 5;
    CGFloat FONT_SIZE = 16;
    CGFloat CELL_CONTENT_WIDTH = 250;

    NSString    *text = value;
    CGSize      constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    CGSize      size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGFloat     height = MAX(size.height, 44.0f);

    return height + (CELL_CONTENT_MARGIN * 2);
}

@end