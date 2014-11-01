#import <Foundation/Foundation.h>

@interface Validator : NSObject

+ (BOOL)validField:(NSString *)text;
+ (BOOL)validWalletId:(NSString *)text;
+ (BOOL)validMatch:(NSString *)text WithText2:(NSString *)text2;
+ (BOOL)validPhone:(NSString *)text;
+ (BOOL)validEmail:(NSString *)text;
+ (BOOL)validCreditCard:(NSString *)text;
+ (BOOL)validExp:(NSString *)text;

@end