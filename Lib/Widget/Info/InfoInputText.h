#import <UIKit/UIKit.h>
#import "AppBuilder.h"

#define kInfoInputTextCharSetUsername @"1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ."
#define kInfoInputTextCharSetNumber @"1234567890"
#define kInfoInputTextCharSetAmount @"1234567890."

@interface InfoInputText : UIView <InfoBase, UITextFieldDelegate>

@property NSString *key;
@property NSString *value;
@property NSString *hint;
@property NSString *charSet;
@property int inputLimit;

@property UILabel *keyView;
@property UITextField *valueView;

@property CGFloat widthKey;
@property CGFloat padOutter;
@property CGFloat padInner;


- (instancetype)initWithInfoVertical:(InfoVerticalScrollView *)container key:(NSString *)key value:(NSString *)value;
- (void)focus;

@end