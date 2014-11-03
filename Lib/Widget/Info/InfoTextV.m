#import "InfoTextV.h"

@implementation InfoTextV

+ (void)initialize
{
    [InfoTextV appearance].backgroundColor = [UIColor whiteColor];
    [InfoTextV appearance].widthKey = 80;
    [InfoTextV appearance].padOutter = 10;
    [InfoTextV appearance].padInner = 10;
    [InfoTextV appearance].keyColor = [UIColor darkGrayColor];
    [InfoTextV appearance].keyFont = [UIFont systemFontOfSize:14];
    [InfoTextV appearance].valueColor = [UIColor darkGrayColor];
    [InfoTextV appearance].valueFont = [UIFont systemFontOfSize:14];
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

    CGSize sizeKey = [self.keyView sizeThatFits:CGSizeMake(contentWidth - self.padOutter * 2, HUGE_VALF)];
    CGSize sizeValue = [self.valueView sizeThatFits:CGSizeMake(contentWidth - self.padOutter * 2, HUGE_VALF)];

    self.keyView.frame = CGRectMake(self.padOutter, self.padOutter, sizeKey.width, sizeKey.height);
    self.valueView.frame = CGRectMake(self.padOutter, self.keyView.frameEndPoint.y + self.padInner, sizeValue.width, sizeValue.height);
    return self.keyView.height + self.valueView.height  + self.padInner + self.padOutter * 2;
}

@end