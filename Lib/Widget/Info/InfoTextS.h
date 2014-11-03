#import <UIKit/UIKit.h>
#import "AppBuilder.h"

@interface InfoTextS : UIView <InfoBase>

@property NSString *key;

@property UILabel *keyView;
@property UIColor *keyColor UI_APPEARANCE_SELECTOR;
@property UIFont *keyFont UI_APPEARANCE_SELECTOR;
@property CGFloat padOutter UI_APPEARANCE_SELECTOR;

- (void)config;
- (instancetype)initWithInfoVertical:(InfoVerticalScrollView *)container key:(NSString *)key;

@end