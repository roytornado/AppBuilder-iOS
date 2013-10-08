//
//  Formatter.h
//  mPOS
//
//  Created by asap on 19/10/12.
//  Copyright (c) 2012 ASAP Transaction Processing Corp. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Formatter : NSObject

+ (NSString *)formatExp:(NSString *)text;
+ (NSString *)formatCreditCard:(NSString *)text;
+ (NSString *)formatCreditCardWithAsterisks:(NSString *)text;

@end