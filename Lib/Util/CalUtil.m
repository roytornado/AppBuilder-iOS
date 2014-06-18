#import "CalUtil.h"

@implementation CalUtil

+ (CGFloat)calHeight:(NSString*)src font:(UIFont*)font width:(CGFloat)width min:(CGFloat)min {
	CGSize labelSize = [src sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
	return labelSize.height > min ? labelSize.height : min;
}

+ (CGFloat)calWidth:(NSString*)src font:(UIFont*)font width:(CGFloat)width min:(CGFloat)min {
	CGSize labelSize = [src sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
	return labelSize.width > min ? labelSize.width : min;
}

@end
