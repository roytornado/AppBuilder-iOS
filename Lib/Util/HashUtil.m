#import "HashUtil.h"

@implementation HashUtil

+ (NSString*) sha256: (NSString *)str{
    NSData *dataIn = [str dataUsingEncoding:NSASCIIStringEncoding];
    NSMutableData *macOut = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(dataIn.bytes, dataIn.length,  macOut.mutableBytes);
    return [macOut hexadecimalString];
}

@end
