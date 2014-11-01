#import "InfoInputLongText.h"

@implementation InfoInputLongText

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

        self.valueView = [[UITextView alloc] init];
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

    self.valueView.backgroundColor = [UIColor orangeColor];
}

- (CGFloat)layout:(CGFloat)contentWidth
{
    self.keyView.text = self.key;
    self.valueView.text = self.value;
    //self.valueView.placeholder = self.hint;

    CGFloat wValue = contentWidth - self.widthKey - self.padOutter * 2 - self.padInner;

    CGSize sizeKey = [self.keyView sizeThatFits:CGSizeMake(self.widthKey, HUGE_VALF)];
    CGSize sizeValue = [self.valueView sizeThatFits:CGSizeMake(wValue, HUGE_VALF)];

    self.keyView.frame = CGRectMake(self.padOutter, self.padOutter, self.widthKey, sizeKey.height);
    self.valueView.frame = CGRectMake(self.keyView.frameEndPoint.x + self.padInner, self.padOutter, wValue, sizeValue.height);
    return MAX(self.keyView.height, self.valueView.height) + self.padOutter * 2;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)string
{
    NSUInteger newLength = [textView.text length] + [string length] - range.length;
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

- (void)textViewDidChange:(UITextView *)textView
{
    self.value = textView.text;
    NSLog(@"textViewDidChange: %@", textView.text);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"InfoSizeDidChanged" object:nil];
}

- (void)focus
{
    [self.valueView becomeFirstResponder];
}

@end