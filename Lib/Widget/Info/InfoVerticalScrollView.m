#import "InfoVerticalScrollView.h"
#import "AppBuilder.h"

@implementation InfoVerticalScrollView {
    CGFloat keyboardHeight;
}

+ (void)initialize
{
    [InfoVerticalScrollView appearance].paddingBetweenViews = 1;
    [InfoVerticalScrollView appearance].paddingTop = 10;
    [InfoVerticalScrollView appearance].paddingBottom = 100;
}

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sizeDidChanged:) name:kInfoNotificationSizeDidChanged object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewDidFocus:) name:kInfoNotificationViewDidFocus object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyboardChanged:(NSNotification *)notification
{
    CGRect keyboardFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    BOOL isKeyboardShowing = keyboardFrame.origin.y < [[UIScreen mainScreen] bounds].size.height;
    if (isKeyboardShowing)
    {
        keyboardHeight = keyboardFrame.size.height;
    }
    else
    {
        keyboardHeight = 0;
    }
    [self setNeedsLayout];
}

- (void)sizeDidChanged:(NSNotification *)notification
{
    UIView *view = notification.object;
    [self setNeedsLayout];
    if (view)
    {
        [self setContentOffset:CGPointMake(0, view.frame.origin.y - 100) animated:YES];
    }
}

- (void)viewDidFocus:(NSNotification *)notification
{
    UIView *view = notification.object;
    [self setContentOffset:CGPointMake(0, view.frame.origin.y - 100) animated:YES];
}

- (void)scrollToBottom
{
    UIView *view = [self.subviews objectAtIndex:(self.subviews.count - 1)];
    [self setContentOffset:CGPointMake(0, view.frame.origin.y - 100) animated:YES];
}

- (void)scrollToView:(UIView *)view
{
    [self setContentOffset:CGPointMake(0, view.frame.origin.y - 100) animated:YES];
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
    curY += keyboardHeight;
    self.contentSize = CGSizeMake(self.width, curY);
}

@end