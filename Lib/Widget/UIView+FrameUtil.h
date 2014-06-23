#import <UIKit/UIKit.h>

@interface UIView (FrameUtil)

- (CGPoint)frameEndPoint;

- (CGFloat)width;
- (CGFloat)height;

- (void)setOrigin:(CGPoint)point;
- (void)setSize:(CGSize)size;

- (void)centerX:(UIView*)parent;
- (void)centerY:(UIView*)parent;

- (void)addSubviewsFromStartV:(CGFloat)pad views:(NSArray*)views;
- (void)addSubviewsFromEndV:(CGFloat)pad views:(NSArray*)views;

@end
