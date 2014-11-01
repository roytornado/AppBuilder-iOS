#import "InfoInputText.h"

@implementation InfoInputText

- (instancetype)initWithInfoVertical:(InfoVerticalScrollView *)container key:(NSString *)key value:(NSString *)value
{
    self = [self init];
    self.key = key;
    self.value = value;
    [container addSubview:self];
    return self;
}

- (id)init
{
    self = [super init];

    if (self)
    {
        self.keyView = [[UILabel alloc] init];
        [self addSubview:self.keyView];

        self.valueView = [[UITextField alloc] init];
        self.valueView.delegate = self;
        [self addSubview:self.valueView];

        [self config];
    }

    return self;
}

- (void)config
{
    self.backgroundColor = [UIColor whiteColor];
    self.keyView.textColor = [UIColor darkGrayColor];
    self.valueView.textColor = [UIColor darkGrayColor];
    self.valueView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.valueView.autocorrectionType = UITextAutocorrectionTypeNo;

    self.inputLimit = 10000;

    self.widthKey = 80;
    self.padOutter = 10;
    self.padInner = 10;
}

- (CGFloat)layout:(CGFloat)contentWidth
{
    self.keyView.text = self.key;
    self.valueView.text = self.value;
    self.valueView.placeholder = self.hint;

    CGFloat wValue = contentWidth - self.widthKey - self.padOutter * 2 - self.padInner;

    self.keyView.frame = CGRectMake(self.padOutter, 0, self.widthKey, 44);
    self.valueView.frame = CGRectMake(self.keyView.frameEndPoint.x + self.padInner, 0, wValue, 44);
    return 44;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    if (self.charSet)
    {
        if (newLength > self.inputLimit)
        {
            return NO;
        }

        NSCharacterSet *validCharSet = [[NSCharacterSet characterSetWithCharactersInString:self.charSet] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:validCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    if (newLength > self.inputLimit)
    {
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
    [self.valueView becomeFirstResponder];
}

@end