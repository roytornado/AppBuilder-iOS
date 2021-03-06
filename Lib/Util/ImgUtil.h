#import <UIKit/UIKit.h>

@interface ImgUtil : NSObject

+ (UIImage *)resizeToMax:(UIImage *)image max:(CGFloat)max;
+ (UIImage *)reize:(UIImage *)image scaledTosize:(CGSize)newSize;
+ (UIImage *)squareImage:(UIImage *)image scaledToSize:(CGFloat)size;
+ (UIImage *)imageWithColor:(UIColor *)color;

@end