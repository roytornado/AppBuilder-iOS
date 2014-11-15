#import <Foundation/Foundation.h>
#import "NSData+Base64.h"

@interface App : NSObject
+ (id)me;

- (void)initBase;

+ (void)addLang:(NSString *)newLang;
+ (void)addLangPath:(NSString *)newLangPath;
+ (NSString *)getString:(NSString *)key;
+ (NSString *)getLang;
+ (void)changeLang:(NSString *)language;
+ (UIColor *)colorFromHexString:(NSString *)hexString;
- (void)savePref:(NSString *)prefKey WithValue:(NSString *)prefValue;
- (NSString *)getPref:(NSString *)prefKey;
- (NSString *)getPackageName;
- (NSString *)getDeviceId;
- (NSString *)getVersionCode;
- (NSString *)getVersionName;
- (NSString *)archiveObject:(NSCoder *)object;
- (id)unarchiveObject:(NSString *)src;

@end