#import <Foundation/Foundation.h>

@interface CalUtil : NSObject

+ (CGFloat)calHeight:(NSString*)src font:(UIFont*)font width:(CGFloat)width min:(CGFloat)min;

+ (CGFloat)calWidth:(NSString*)src font:(UIFont*)font width:(CGFloat)width min:(CGFloat)min;

+ (CGSize)calAttrSize:(NSString*)src constrain:(CGSize)constrain;

@end
