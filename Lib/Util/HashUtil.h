#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
#import "NSData+NSData_Conversion.h"

@interface HashUtil : NSObject

+ (NSString*)sha256: (NSString *)str;

@end
