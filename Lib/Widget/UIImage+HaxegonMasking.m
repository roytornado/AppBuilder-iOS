#import "UIImage+HaxegonMasking.h"

@implementation UIImage (HaxegonMasking)

- (UIImage *)imageWithOverlayColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);

    if (UIGraphicsBeginImageContextWithOptions)
    {
        CGFloat imageScale = 1.0f;
        if ([self respondsToSelector:@selector(scale)])   // The scale property is new with iOS4.
        {
            imageScale = self.scale;
        }
        UIGraphicsBeginImageContextWithOptions(self.size, NO, imageScale);
    }
    else
    {
        UIGraphicsBeginImageContext(self.size);
    }

    [self drawInRect:rect];

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);

    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

- (UIImage *)setImageMaskedWithHexagon
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(ctx, YES);
    CGContextSetInterpolationQuality(ctx, kCGInterpolationHigh);
    UIBezierPath *path = [UIImage bezierPathWithHexagonInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGContextSaveGState(ctx);
    [path addClip];
    [self drawAtPoint:CGPointMake(0, 0)];
    CGContextRestoreGState(ctx);

    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return retImage;
}

- (UIImage *)setImageMaskedWithCircle
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(ctx, YES);
    CGContextSetInterpolationQuality(ctx, kCGInterpolationHigh);
    CGRect box = CGRectMake(0, 0, self.size.width, self.size.height);
    box = CGRectInset(box, 1, 1);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:box];
    CGContextSaveGState(ctx);
    [path addClip];
    [self drawAtPoint:CGPointMake(0, 0)];
    CGContextRestoreGState(ctx);

    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return retImage;
}

- (UIImage *)squareImageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    double ratio;
    double delta;
    CGPoint offset;

    //make a new square size, that is the resized imaged width
    CGSize sz = CGSizeMake(newSize.width, newSize.width);

    //figure out if the picture is landscape or portrait, then
    //calculate scale factor and offset
    if (image.size.width > image.size.height)
    {
        ratio = newSize.width / image.size.width;
        delta = (ratio * image.size.width - ratio * image.size.height);
        offset = CGPointMake(delta / 2, 0);
    }
    else
    {
        ratio = newSize.width / image.size.height;
        delta = (ratio * image.size.height - ratio * image.size.width);
        offset = CGPointMake(0, delta / 2);
    }

    //make the final clipping rect based on the calculated values
    CGRect clipRect = CGRectMake(-offset.x, -offset.y,
                                 (ratio * image.size.width) + delta,
                                 (ratio * image.size.height) + delta);


    //start a new context, with scale factor 0.0 so retina displays get
    //high quality image
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
    {
        UIGraphicsBeginImageContextWithOptions(sz, YES, 0.0);
    }
    else
    {
        UIGraphicsBeginImageContext(sz);
    }
    UIRectClip(clipRect);
    [image drawInRect:clipRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

- (UIImage *)cropForXAxis:(CGFloat)x1 x2:(CGFloat)x2
{
    CGRect clipRect = CGRectMake(x1, 0, x2 - x1, self.size.height);

    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
    {
        UIGraphicsBeginImageContextWithOptions(clipRect.size, NO, 0.0);
    }
    else
    {
        UIGraphicsBeginImageContext(clipRect.size);
    }
    [self drawAtPoint:(CGPoint) {-clipRect.origin.x, -clipRect.origin.y }
     ];
    UIImage *croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return croppedImage;
}

+ (UIBezierPath *)bezierPathWithHexagonInRect:(CGRect)rect
{
    int numberOfSides = 6;

    CGFloat xRadius = CGRectGetWidth(rect) / 2;
    CGFloat yRadius = CGRectGetHeight(rect) / 2;

    CGFloat centerX = CGRectGetMidX(rect);
    CGFloat centerY = CGRectGetMidY(rect);

    UIBezierPath *bezierPath = [UIBezierPath bezierPath];

    [bezierPath moveToPoint:CGPointMake(centerX + 0, centerY + yRadius)];

    for (NSUInteger i = 0; i < numberOfSides; i++)
    {
        CGFloat theta = 2 * M_PI / numberOfSides * i + (2 * M_PI / 4);
        CGFloat xCoordinate = centerX + xRadius * cosf(theta);
        CGFloat yCoordinate = centerY + yRadius * sinf(theta);
        [bezierPath addLineToPoint:CGPointMake(xCoordinate, yCoordinate)];
    }
    [bezierPath closePath];
    return bezierPath;
}

@end