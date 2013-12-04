#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "InfoBase.h"
#import "InfoSection.h"

@interface InfoInputNext : NSObject <InfoBase>

@property NSString  *key;
@property NSString  *value;
@property NSString  *tag;

+ (InfoInputNext *)createToSection:(InfoSection *)parent WithKey:(NSString *)_key WithValue:(NSString *)_value WithTag:(NSString *)_tag;

@end