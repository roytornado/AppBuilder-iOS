#import <Foundation/Foundation.h>

@interface WidgetStyle : NSObject

+ (void)roundedCorners:(UIView *)view;
+ (void)btnStyle:(UIButton *)btn style:(NSString *)style;
+ (void)btnWithColor:(UIButton *)btn normal:(UIColor *)normal highlight:(UIColor *)highlight selected:(UIColor *)selected;
+ (UIImage *)imageWithColor:(UIColor *)color;

@end