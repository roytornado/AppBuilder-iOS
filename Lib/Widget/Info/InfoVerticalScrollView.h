#import <UIKit/UIKit.h>

@interface InfoVerticalScrollView : UIScrollView

@property CGFloat paddingBetweenViews UI_APPEARANCE_SELECTOR;
@property CGFloat paddingTop UI_APPEARANCE_SELECTOR;
@property CGFloat paddingBottom UI_APPEARANCE_SELECTOR;

- (void)scrollToBottom;
- (void)scrollToView:(UIView *)view;

@end