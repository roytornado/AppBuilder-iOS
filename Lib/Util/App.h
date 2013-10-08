#import <Foundation/Foundation.h>

@interface App : NSObject

+ (id)me;
- (void)addLangPath:(NSString *)newLangPath;
- (NSString *)getString:(NSString *)key;
- (void)savePref:(NSString *)prefKey WithValue:(NSString *)prefValue;
- (NSString *)getPref:(NSString *)prefKey;

@end
