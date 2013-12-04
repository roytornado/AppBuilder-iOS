#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "InfoBase.h"
#import "InfoSection.h"

@interface InfoTextV : NSObject <InfoBase>

@property NSString  *key;
@property NSString  *value;

+ (InfoTextV *)createToSection:(InfoSection *)parent WithKey:(NSString *)_key WithValue:(NSString *)_value;

@end