#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "InfoBase.h"
#import "InfoSection.h"

@interface InfoTextH : NSObject <InfoBase>

@property NSString              *key;
@property NSString              *value;
@property UITableViewCellStyle  style;

+ (InfoTextH *)createToSection:(InfoSection *)parent WithKey:(NSString *)_key WithValue:(NSString *)_value WithStyle:(UITableViewCellStyle)_style;
+ (InfoTextH *)createToSection:(InfoSection *)parent WithKey:(NSString *)_key WithValue:(NSString *)_value;

@end