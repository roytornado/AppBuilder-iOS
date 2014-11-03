#import "InfoTextS.h"

@implementation InfoTextS

+ (void)initialize
{
    [InfoTextS appearance].backgroundColor = [UIColor clearColor];
    [InfoTextS appearance].padOutter = 10;
    [InfoTextS appearance].keyColor = [UIColor whiteColor];
    [InfoTextS appearance].keyFont = [UIFont systemFontOfSize:16];
}

- (instancetype)initWithInfoVertical:(InfoVerticalScrollView *)container key:(NSString *)key
{
    self = [self init];
    self.key = key;

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
        [self config];
    }

    return self;
}

- (void)config
{
    self.keyView.numberOfLines = 0;
}

- (CGFloat)layout:(CGFloat)contentWidth
{
    self.keyView.textColor = self.keyColor;
    self.keyView.font = self.keyFont;

    self.keyView.text = self.key;

    CGSize sizeKey = [self.keyView sizeThatFits:CGSizeMake(contentWidth - self.padOutter * 2, HUGE_VALF)];

    self.keyView.frame = CGRectMake(self.padOutter, self.padOutter, sizeKey.width, sizeKey.height);
    return self.keyView.height + self.padOutter * 2;
}

@end