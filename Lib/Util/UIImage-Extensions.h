#import <Foundation/Foundation.h>

@interface UIImage (CS_Extensions)
- (UIImage*)imageAtRect:(CGRect)rect;
- (UIImage*)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage*)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (UIImage*)imageByScalingToSize:(CGSize)targetSize;
- (UIImage*)imageRotatedByRadians:(CGFloat)radians;
- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees;

@end;
