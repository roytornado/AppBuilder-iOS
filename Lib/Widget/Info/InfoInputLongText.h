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

@property CGFloat widthKey;
@property CGFloat padOutter;
@property CGFloat padInner;


- (instancetype)initWithInfoVertical:(InfoVerticalScrollView *)container key:(NSString *)key value:(NSString *)value;
- (void)focus;

@end