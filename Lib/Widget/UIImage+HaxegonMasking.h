#import <UIKit/UIKit.h>

@interface UIImage (HaxegonMasking)

- (UIImage *)imageWithOverlayColor:(UIColor *)color;
- (UIImage *)setImageMaskedWithHexagon;
- (UIImage *)setImageMaskedWithCircle;
- (UIImage *)squareImageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
- (UIImage *)cropForXAxis:(CGFloat)x1 x2:(CGFloat)x2;

+ (UIBezierPath *)bezierPathWithHexagonInRect:(CGRect)rect;

@end
