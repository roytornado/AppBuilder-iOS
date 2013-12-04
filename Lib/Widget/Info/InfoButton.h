#import <Foundation/Foundation.h>
#import "InfoBase.h"
#import "InfoSection.h"

@interface InfoButton : NSObject <InfoBase>

@property NSString	*key;
@property NSString	*tag;

+ (InfoButton *)createToSection:(InfoSection *)parent WithLabel:(NSString *)_key WithTag:(NSString *)_tag;

@end