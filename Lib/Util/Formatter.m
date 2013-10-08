//
//  Formatter.m
//  mPOS
//
//  Created by asap on 19/10/12.
//  Copyright (c) 2012 ASAP Transaction Processing Corp. Ltd. All rights reserved.
//

#import "Formatter.h"

@implementation Formatter

+ (NSString *)formatExp:(NSString *)text
{
    if ([text length] > 2) {
        NSString    *p1 = [text substringWithRange:NSMakeRange(0, 2)];
        NSString    *pLast = [text substringFromIndex:2];
        return [NSString stringWithFormat:@"%@ / %@", p1, pLast];
    } else {
        return text;
    }
}

+ (NSString *)formatCreditCard:(NSString *)text
{
    if ([text length] > 12) {
        NSString    *p1 = [text substringWithRange:NSMakeRange(0, 4)];
        NSString    *p2 = [text substringWithRange:NSMakeRange(4, 4)];
        NSString    *p3 = [text substringWithRange:NSMakeRange(8, 4)];
        NSString    *pLast = [text substringFromIndex:12];

        return [NSString stringWithFormat:@"%@-%@-%@-%@", p1, p2, p3, pLast];
    } else if ([text length] > 8) {
        NSString    *p1 = [text substringWithRange:NSMakeRange(0, 4)];
        NSString    *p2 = [text substringWithRange:NSMakeRange(4, 4)];
        NSString    *pLast = [text substringFromIndex:8];
        return [NSString stringWithFormat:@"%@-%@-%@", p1, p2, pLast];
    } else if ([text length] > 4) {
        NSString    *p1 = [text substringWithRange:NSMakeRange(0, 4)];
        NSString    *pLast = [text substringFromIndex:4];
        return [NSString stringWithFormat:@"%@-%@", p1, pLast];
    } else {
        return text;
    }
}

+ (NSString *)formatCreditCardWithAsterisks:(NSString *)text
{
    if ([text length] > 12) {
        NSString *pLast = [text substringFromIndex:12];
        return [NSString stringWithFormat:@"XXXX-XXXX-XXXX-%@", pLast];
    } else if ([text length] > 8) {
        NSString *pLast = [text substringFromIndex:8];
        return [NSString stringWithFormat:@"XXXX-XXXX-%@", pLast];
    } else if ([text length] > 4) {
        NSString *pLast = [text substringFromIndex:4];
        return [NSString stringWithFormat:@"XXXX-%@", pLast];
    } else {
        return text;
    }
}

@end