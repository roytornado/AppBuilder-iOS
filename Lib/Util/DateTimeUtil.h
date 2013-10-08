#import <UIKit/UIKit.h>

@interface DateTimeUtil : NSObject

+ (NSString *)getTime;
+ (NSDate *)parseTime:(NSString *)timems;
+ (NSString *)formatTime:(NSDate *)date;
+ (NSString *)formatDate:(NSDate *)date;
@end