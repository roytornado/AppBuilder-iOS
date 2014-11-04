#import "InfoInputText.h"

@implementation InfoInputText

+ (void)initialize
{
    [InfoInputText appearance].backgroundColor = [UIColor whiteColor];
    [InfoInputText appearance].widthKey = 80;
    [InfoInputText appearance].padOutter = 10;
    [InfoInputText appearance].padInner = 10;
    [InfoInputText appearance].keyColor = [UIColor darkGrayColor];
    [InfoInputText appearance].keyFont = [UIFont systemFontOfSize:14];
    [InfoInputText appearance].valueColor = [UIColor darkGrayColor];
    [InfoInputText appearance].valueFont = [UIFont systemFontOfSize:14];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

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


        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange) name:UITextFieldTextDidChangeNotification object:nil];

        [self config];
    }

    return self;
}

- (void)config
{
    self.valueView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.valueView.autocorrectionType = UITextAutocorrectionTypeNo;
    self.inputLimit = 10000;
}

- (CGFloat)layout:(CGFloat)contentWidth
{
    self.keyView.textColor = self.keyColor;
    self.keyView.font = self.keyFont;
    self.valueView.textColor = self.valueColor;
    self.valueView.font = self.valueFont;

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
    BOOL flag = YES;
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    if (self.charSet)
    {
        if (newLength > self.inputLimit)
        {
            flag =  NO;
        }

        NSCharacterSet *validCharSet = [[NSCharacterSet characterSetWithCharactersInString:self.charSet] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:validCharSet] componentsJoinedByString:@""];
        flag =  [string isEqualToString:filtered];
    }
    if (newLength > self.inputLimit)
    {
        flag =  NO;
    }

    if (flag)
    {
        self.value = string;
    }
    return flag;
}

- (void)textViewDidChange
{
    self.value = self.valueView.text;
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