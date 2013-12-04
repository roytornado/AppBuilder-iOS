#import "InfoInputText.h"
#import "Formatter.h"

@implementation InfoInputText {
    UITableViewCell *my_cell;
    UITextField     *input;
    NSMutableString *valTemp;
}
@synthesize value;
@synthesize key, hint, type;

+ (InfoInputText *)createToSection:(InfoSection *)parent WithKey:(NSString *)_key WithValue:(NSString *)_value WithType:(InfoInputTextType)_type
{
    InfoInputText *obj = [[InfoInputText alloc] init];

    obj.key = _key;
    obj.value = _value;
    obj.type = _type;
    [parent.cells addObject:obj];
    return obj;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        valTemp = [[NSMutableString alloc] init];
    }
    
    return self;
}

- (NSString *)getCellId
{
    return @"InfoInputText";
}

- (UITableViewCell *)create
{
    my_cell = [[InputTextCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[self getCellId]];
    input = [[UITextField alloc] initWithFrame:CGRectMake(120, 15, 170, 35)];
    input.delegate = self;
    input.autocorrectionType = UITextAutocorrectionTypeNo;
    input.placeholder = @"Input here";
    [my_cell.contentView addSubview:input];
    my_cell.detailTextLabel.frame = CGRectMake(my_cell.detailTextLabel.frame.origin.x
        , my_cell.detailTextLabel.frame.origin.y + 10, my_cell.detailTextLabel.frame.size.width, my_cell.detailTextLabel.frame.size.height);

    my_cell.textLabel.numberOfLines = 0;
    my_cell.textLabel.font = [UIFont boldSystemFontOfSize:11];


    input.font = [UIFont boldSystemFontOfSize:16];

    my_cell.detailTextLabel.numberOfLines = 0;
    my_cell.detailTextLabel.font = [UIFont systemFontOfSize:11];
    my_cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    return my_cell;
}

- (void)fill
{
    if (type == InfoInputTextTypeDefault) {
        input.autocapitalizationType = UITextAutocapitalizationTypeNone;
        input.autocorrectionType = UITextAutocorrectionTypeNo;
        input.keyboardType = UIKeyboardTypeDefault;
    }

    if (type == InfoInputTextTypeUserId) {
        input.autocapitalizationType = UITextAutocapitalizationTypeNone;
        input.autocorrectionType = UITextAutocorrectionTypeNo;
        input.keyboardType = UIKeyboardTypeDefault;
    }

    if (type == InfoInputTextTypeName) {
        input.autocapitalizationType = UITextAutocapitalizationTypeWords;
        input.autocorrectionType = UITextAutocorrectionTypeNo;
        input.keyboardType = UIKeyboardTypeDefault;
    }

    if (type == InfoInputTextTypeEmail) {
        input.autocapitalizationType = UITextAutocapitalizationTypeNone;
        input.autocorrectionType = UITextAutocorrectionTypeNo;
        input.keyboardType = UIKeyboardTypeEmailAddress;
    }

    if (type == InfoInputTextTypePhone) {
        input.autocapitalizationType = UITextAutocapitalizationTypeNone;
        input.autocorrectionType = UITextAutocorrectionTypeNo;
        input.keyboardType = UIKeyboardTypePhonePad;
    }
    //[input addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    my_cell.textLabel.text = key;
    input.text = self.value;
    my_cell.detailTextLabel.text = hint;
}

- (CGFloat)getHeight
{
    CGFloat CELL_CONTENT_MARGIN = 5;
    CGFloat FONT_SIZE = 16;
    CGFloat CELL_CONTENT_WIDTH = 200;

    NSString    *text = self.value;
    CGSize      constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    CGSize      size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGFloat     height = MAX(size.height, 44.0f);

    if (hint) {
        CGSize  constraint = CGSizeMake(300, 20000.0f);
        CGSize  size = [hint sizeWithFont:[UIFont systemFontOfSize:10] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
        height += size.height;
    }

    return height + (CELL_CONTENT_MARGIN * 2);
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.value = input.text;
}

- (void)textFieldDidChange:(UITextField *)textField
{
    self.value = input.text;
}

- (NSString *)getValue
{
    return value;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (type == InfoInputTextTypeUserId) {
        NSUInteger newLength = [textField.text length] + [string length] - range.length;

        if (newLength > 30) {
            return NO;
        }

        NSCharacterSet  *validCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ."] invertedSet];
        NSString        *filtered = [[string componentsSeparatedByCharactersInSet:validCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }

    if (type == InfoInputTextTypePhone) {
        NSUInteger newLength = [textField.text length] + [string length] - range.length;

        if (newLength > 8) {
            return NO;
        }

        NSCharacterSet  *validCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        NSString        *filtered = [[string componentsSeparatedByCharactersInSet:validCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;

    if (newLength > 255) {
        return NO;
    }

    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)focus
{
    [input becomeFirstResponder];
}

@end