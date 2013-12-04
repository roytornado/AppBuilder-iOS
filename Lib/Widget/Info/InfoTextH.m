#import "InfoTextH.h"

@implementation InfoTextH {
    UITableViewCell *my_cell;
}
@synthesize key, value, style;

+ (InfoTextH *)createToSection:(InfoSection *)parent WithKey:(NSString *)_key WithValue:(NSString *)_value WithStyle:(UITableViewCellStyle)_style
{
    InfoTextH *obj = [[InfoTextH alloc] init];

    obj.key = _key;
    obj.value = _value;
    obj.style = _style;

    [parent.cells addObject:obj];
    return obj;
}

+ (InfoTextH *)createToSection:(InfoSection *)parent WithKey:(NSString *)_key WithValue:(NSString *)_value
{
    InfoTextH *obj = [[InfoTextH alloc] init];

    obj.key = _key;
    obj.value = _value;
    obj.style = UITableViewCellStyleValue2;

    [parent.cells addObject:obj];
    return obj;
}

- (NSString *)getCellId
{
    return @"InfoTextHCell";
}

- (UITableViewCell *)create
{
    my_cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:[self getCellId]];

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
    CGFloat CELL_CONTENT_WIDTH = 200;

    NSString    *text = value;
    CGSize      constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    CGSize      size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGFloat     height = MAX(size.height, 44.0f);

    return height + (CELL_CONTENT_MARGIN * 2);
}

@end