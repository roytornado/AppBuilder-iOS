#import "Validator.h"

#define kMagicSubtractionNumber 48 // The ASCII value of 0

@implementation Validator

+ (BOOL)validField:(NSString *)text
{
    if (text && ([text length] > 0)) {
        return YES;
    }

    return NO;
}

+ (BOOL)validWalletId:(NSString *)text
{
    if (![Validator validField:text]) {
        return NO;
    }

    NSError             *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression
        regularExpressionWithPattern:@"^[a-zA-Z0-9\\.]{6,30}$"
        options                     :0
        error                       :&error];

    NSUInteger count = [regex   numberOfMatchesInString :text
                                options                 :0
                                range                   :NSMakeRange(0, [text length])];

    if (count > 0) {
        return YES;
    }

    return NO;
}

+ (BOOL)validMatch:(NSString *)text WithText2:(NSString *)text2
{
    if (![Validator validField:text]) {
        return NO;
    }

    if (![Validator validField:text2]) {
        return NO;
    }

    if ([text isEqualToString:text2]) {
        return YES;
    }

    return NO;
}

+ (BOOL)validPhone:(NSString *)text
{
    if (![Validator validField:text]) {
        return NO;
    }

    NSError             *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression
        regularExpressionWithPattern:@"^[5|6|8|9][0-9]{7}$"
        options                     :0
        error                       :&error];

    NSUInteger count = [regex   numberOfMatchesInString :text
                                options                 :0
                                range                   :NSMakeRange(0, [text length])];

    if (count > 0) {
        return YES;
    }

    return NO;
}

+ (BOOL)validEmail:(NSString *)text
{
    if (![Validator validField:text]) {
        return NO;
    }

    NSError             *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression
        regularExpressionWithPattern:@"[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+"
        options                     :0
        error                       :&error];

    NSUInteger count = [regex   numberOfMatchesInString :text
                                options                 :0
                                range                   :NSMakeRange(0, [text length])];

    if (count > 0) {
        return YES;
    }

    return NO;
}

+ (BOOL)validCreditCard:(NSString *)cardNumber
{
    if (![Validator validField:cardNumber]) {
        return NO;
    }

    if ([cardNumber length] != 16) {
        return NO;
    }

    int Luhn = 0;

    for (int i = 0; i < [cardNumber length]; i++) {
        NSUInteger  count = [cardNumber length] - 1;
        int         doubled = [[NSNumber numberWithUnsignedChar:[cardNumber characterAtIndex:count - i]] intValue] - kMagicSubtractionNumber;

        if (i % 2) {
            doubled = doubled * 2;
        }

        NSString *double_digit = [NSString stringWithFormat:@"%d", doubled];

        if ([[NSString stringWithFormat:@"%d", doubled] length] > 1) {
            Luhn = Luhn + [[NSNumber numberWithUnsignedChar:[double_digit characterAtIndex:0]] intValue] - kMagicSubtractionNumber;
            Luhn = Luhn + [[NSNumber numberWithUnsignedChar:[double_digit characterAtIndex:1]] intValue] - kMagicSubtractionNumber;
        } else {Luhn = Luhn + doubled; }
    }

    if (Luhn % 10 == 0) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)validExp:(NSString *)text
{
    if (![Validator validField:text]) {
        return NO;
    }

    if ([text length] != 4) {
        return NO;
    }

    NSInteger   targetMonth = [[text substringWithRange:NSMakeRange(0, 2)] integerValue];
    NSInteger   targetYear = [[text substringWithRange:NSMakeRange(2, 2)] integerValue] + 2000;

    if ((targetMonth < 1) || (targetMonth > 12)) {
        return NO;
    }

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString    *targetStr = [NSString stringWithFormat:@"%d-%d-01", targetYear, targetMonth];
    NSDate      *target = [formatter dateFromString:targetStr];
    NSDate      *today = [NSDate date];
    NSComparisonResult result = [target compare:today];
    if(result == NSOrderedDescending){
        return YES;
    }
    return NO;
}

@end