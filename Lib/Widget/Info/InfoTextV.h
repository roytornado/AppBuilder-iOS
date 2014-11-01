#import <UIKit/UIKit.h>
#import "AppBuilder.h"

@interface InfoTextV : UIView <InfoBase>

@property NSString *key;
@property NSString *value;

@property UILabel *keyView;
@property UILabel *valueView;

@property CGFloat widthKey;
@property CGFloat padOutter;
@property CGFloat padInner;


- (void)config;
- (instancetype)initWithInfoVertical:(InfoVerticalScrollView *)container key:(NSString *)key value:(NSString *)value;

@end