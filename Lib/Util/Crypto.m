#import "Crypto.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSData+Base64.h"
#import "NSString+Base64.h"
#import "NSData+CommonCrypto.h"

@implementation Crypto

+ (NSString *)MD5:(NSString *)src
{
	const char		*original_str = [src UTF8String];
	unsigned char	result[CC_MD5_DIGEST_LENGTH];

	CC_MD5(original_str, strlen(original_str), result);
	NSMutableString *hash = [NSMutableString string];

	for (int i = 0; i < 16; i++) {
		[hash appendFormat:@"%02X", result[i]];
	}

	return [hash lowercaseString];
}

+ (NSString *)encrypt:(NSString *)message password:(NSString *)password
{
	NSData		*encryptedData			= [[message dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptedDataUsingKey:[[password dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
	NSString	*base64EncodedString	= [NSString base64StringFromData:encryptedData length:[encryptedData length]];

	return base64EncodedString;
}

+ (NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password
{
	NSData	*encryptedData	= [NSData base64DataFromString:base64EncodedString];
	NSData	*decryptedData	= [encryptedData decryptedAES256DataUsingKey:[[password dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];

	return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
}

@end