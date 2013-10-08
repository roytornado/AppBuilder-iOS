#import "DateTimeUtil.h"

@implementation DateTimeUtil

+ (NSString *)getTime
{
    NSTimeInterval  millisecondedDate = ([[NSDate date] timeIntervalSince1970] * 1000);
    NSString        *now = [NSString stringWithFormat:@"%.0f", millisecondedDate];

    return now;
}

+ (NSDate *)parseTime:(NSString *)timems
{
    NSTimeInterval  millisecondedDate = [timems doubleValue] / 1000;
    NSDate          *date = [NSDate dateWithTimeIntervalSince1970:millisecondedDate];

    return date;
}

+ (NSString *)formatTime:(NSDate *)date
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];

    [format setDateFormat:@"MMM dd, yyyy HH:mm"];
    return [format stringFromDate:date];
}

+ (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];

    [format setDateFormat:@"MMM dd, yyyy"];
    return [format stringFromDate:date];
}

@end