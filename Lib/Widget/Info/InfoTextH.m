#import "InfoTextH.h"

@implementation InfoTextH

+ (void)initialize
{
    [InfoTextH appearance].backgroundColor = [UIColor whiteColor];
    [InfoTextH appearance].widthKey = 80;
    [InfoTextH appearance].padOutter = 10;
    [InfoTextH appearance].padInner = 10;
    [InfoTextH appearance].keyColor = [UIColor darkGrayColor];
    [InfoTextH appearance].keyFont = [UIFont systemFontOfSize:14];
    [InfoTextH appearance].valueColor = [UIColor darkGrayColor];
    [InfoTextH appearance].valueFont = [UIFont systemFontOfSize:14];
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
        self.valueView = [[UILabel alloc] init];
        [self addSubview:self.valueView];
        [self config];
    }

    return self;
}

- (void)config
{
    self.keyView.numberOfLines = 0;
    self.valueView.numberOfLines = 0;
}

- (CGFloat)layout:(CGFloat)contentWidth
{
    self.keyView.textColor = self.keyColor;
    self.keyView.font = self.keyFont;
    self.valueView.textColor = self.valueColor;
    self.valueView.font = self.valueFont;

    self.keyView.text = self.key;
    self.valueView.text = self.value;


    CGFloat wValue = contentWidth - self.widthKey - self.padOutter * 2 - self.padInner;

    CGSize sizeKey = [self.keyView sizeThatFits:CGSizeMake(self.widthKey, HUGE_VALF)];
    CGSize sizeValue = [self.valueView sizeThatFits:CGSizeMake(wValue, HUGE_VALF)];

    self.keyView.frame = CGRectMake(self.padOutter, self.padOutter, self.widthKey, sizeKey.height);
    self.valueView.frame = CGRectMake(self.keyView.frameEndPoint.x + self.padInner, self.padOutter, sizeValue.width, sizeValue.height);
    return MAX(self.keyView.height, self.valueView.height) + self.padOutter * 2;
}

@end