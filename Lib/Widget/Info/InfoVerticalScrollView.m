#import "InfoVerticalScrollView.h"
#import "AppBuilder.h"

@implementation InfoVerticalScrollView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self baseClassInit];
    }
    return self;
}

- (void)baseClassInit
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sizeDidChanged) name:@"InfoSizeDidChanged" object:nil];
    self.paddingBetweenViews = 1;
    self.paddingTop = 10;
    self.paddingBottom = 10;
}

- (void)sizeDidChanged
{
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    CGFloat curY = self.paddingTop;
    for (UIView *subView in self.subviews)
    {
        if ([subView conformsToProtocol:@protocol(InfoBase)])
        {
            id <InfoBase> targetView = (id <InfoBase> )subView;
            CGFloat height = [targetView layout:self.width];
            subView.frame = CGRectMake(0, curY, self.width, height);
            curY += height + self.paddingBetweenViews;
        }
        else
        {
            subView.frame = CGRectZero;
        }
    }
    curY += self.paddingBottom;

    self.contentSize = CGSizeMake(self.width, curY);
}

@end