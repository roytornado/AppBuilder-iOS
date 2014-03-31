#import <UIKit/UIKit.h>

@interface ImgUtil : NSObject

+ (UIImage *)reize:(UIImage *)image scaledTosize:(CGSize)newSize;
+ (UIImage *)squareImage:(UIImage *)image scaledToSize:(CGFloat)size;

@end
