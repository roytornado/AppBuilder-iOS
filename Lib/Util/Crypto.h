#import <Foundation/Foundation.h>

@interface Crypto : NSObject

+ (NSString *)MD5:(NSString *)src;
+ (NSString *)encrypt:(NSString *)message password:(NSString *)password;
+ (NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password;

@end