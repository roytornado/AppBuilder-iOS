#import <Foundation/Foundation.h>

@interface App : NSObject
+ (id)me;

- (void)initBase;

+ (void)addLangPath:(NSString*)newLangPath;
+ (NSString*)getString:(NSString*)key;
+ (NSString*)getLang;
+ (void)changeLang:(NSString*)language;
+ (UIColor*)colorFromHexString:(NSString*)hexString;
- (void)savePref:(NSString*)prefKey WithValue:(NSString*)prefValue;
- (NSString*)getPref:(NSString*)prefKey;
- (NSString*)getPackageName;
- (NSString*)getDeviceId;
- (NSString*)getVersionCode;
- (NSString*)getVersionName;
@end
