#import <UIKit/UIKit.h>
#import "AppBuilder.h"

@interface InfoTextH : UIView <InfoBase>

@property NSString *key;
@property NSString *value;

@property UILabel *keyView;
@property UILabel *valueView;

@property UIColor *keyColor UI_APPEARANCE_SELECTOR;
@property UIFont *keyFont UI_APPEARANCE_SELECTOR;
@property UIColor *valueColor UI_APPEARANCE_SELECTOR;
@property UIFont *valueFont UI_APPEARANCE_SELECTOR;
@property CGFloat widthKey UI_APPEARANCE_SELECTOR;
@property CGFloat padOutter UI_APPEARANCE_SELECTOR;
@property CGFloat padInner UI_APPEARANCE_SELECTOR;

- (instancetype)initWithInfoVertical:(InfoVerticalScrollView *)container key:(NSString *)key value:(NSString *)value;

@end