#import "WidgetStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation WidgetStyle

+ (void)roundedCorners:(UIView *)view
{
	// border radius
	[view.layer setCornerRadius:8.0f];
	// border
	[view.layer setBorderColor:[UIColor lightGrayColor].CGColor];
	[view.layer setBorderWidth:1.5f];
}

+ (void)btnStyle:(UIButton *)btn style:(NSString *)style
{
	NSString	*imgNormal		= [style stringByAppendingString:@"Button.png"];
	NSString	*imgHighlight	= [style stringByAppendingString:@"ButtonHighlight.png"];

	[btn setBackgroundImage:[[UIImage imageNamed:imgNormal]
	resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)] forState:UIControlStateNormal];
	[btn setBackgroundImage:[[UIImage imageNamed:imgHighlight]
	resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)] forState:UIControlStateHighlighted];
	[btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
}

+ (void)btnWithColor:(UIButton *)btn normal:(UIColor *)normal highlight:(UIColor *)highlight selected:(UIColor *)selected
{
	[btn setBackgroundImage:[WidgetStyle imageWithColor:normal] forState:UIControlStateNormal];
	[btn setBackgroundImage:[WidgetStyle imageWithColor:highlight] forState:UIControlStateHighlighted];
	[btn setBackgroundImage:[WidgetStyle imageWithColor:selected] forState:UIControlStateSelected];
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
	CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);

	UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
	CGContextRef context = UIGraphicsGetCurrentContext();

	CGContextSetFillColorWithColor(context, [color CGColor]);
	CGContextFillRect(context, rect);

	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

	return image;
}

@end