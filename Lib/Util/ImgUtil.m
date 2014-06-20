#import "ImgUtil.h"

@implementation ImgUtil

+ (UIImage*)reize:(UIImage*)image scaledTosize:(CGSize)newSize {
	UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
	[image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}

+ (UIImage*)squareImage:(UIImage*)image scaledToSize:(CGFloat)size {
	double ratio;
	double delta;
	CGPoint offset;

	//make a new square size, that is the resized imaged width
	CGSize sz = CGSizeMake(size, size);

	//figure out if the picture is landscape or portrait, then
	//calculate scale factor and offset
	if(image.size.width > image.size.height){
		ratio = size / image.size.width;
		delta = (ratio * image.size.width - ratio * image.size.height);
		offset = CGPointMake(delta / 2, 0);
	}
	else {
		ratio = size / image.size.height;
		delta = (ratio * image.size.height - ratio * image.size.width);
		offset = CGPointMake(0, delta / 2);
	}

	//make the final clipping rect based on the calculated values
	CGRect clipRect = CGRectMake(-offset.x, -offset.y,
	                             (ratio * image.size.width) + delta,
	                             (ratio * image.size.height) + delta);


	//start a new context, with scale factor 0.0 so retina displays get
	//high quality image
	if([[UIScreen mainScreen] respondsToSelector:@selector(scale)]){
		UIGraphicsBeginImageContextWithOptions(sz, YES, 0.0);
	}
	else {
		UIGraphicsBeginImageContext(sz);
	}
	UIRectClip(clipRect);
	[image drawInRect:clipRect];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

	return newImage;
}

+ (UIImage*)imageWithColor:(UIColor*)color
{
	CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);

	UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
	CGContextRef context = UIGraphicsGetCurrentContext();

	CGContextSetFillColorWithColor(context, [color CGColor]);
	CGContextFillRect(context, rect);

	UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

	return image;
}

@end
