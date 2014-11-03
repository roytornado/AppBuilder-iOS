#import <UIKit/UIKit.h>
#import "AppBuilder.h"

@interface InfoInputLongText : UIView <InfoBase, UITextViewDelegate>

@property NSString *key;
@property NSString *value;
@property NSString *hint;
@property NSString *charSet;
@property int inputLimit;

@property UILabel *keyView;
@property UITextView *valueView;

@property UIColor *keyColor UI_APPEARANCE_SELECTOR;
@property UIFont *keyFont UI_APPEARANCE_SELECTOR;
@property UIColor *valueColor UI_APPEARANCE_SELECTOR;
@property UIFont *valueFont UI_APPEARANCE_SELECTOR;
@property CGFloat widthKey UI_APPEARANCE_SELECTOR;
@property CGFloat padOutter UI_APPEARANCE_SELECTOR;
@property CGFloat padInner UI_APPEARANCE_SELECTOR;


- (instancetype)initWithInfoVertical:(InfoVerticalScrollView *)container key:(NSString *)key value:(NSString *)value;
- (void)focus;

@end