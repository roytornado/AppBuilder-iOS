#import <UIKit/UIKit.h>

@interface SuperUIImageView : UIImageView <UIGestureRecognizerDelegate>{
	@protected
	UIPinchGestureRecognizer	*_pinchRecogniser;
	UIRotationGestureRecognizer *_rotateRecogniser;
	UIPanGestureRecognizer		*_panRecogniser;
	UITapGestureRecognizer		*_tapRecogniser;
}

- (void)reset;
- (void)resetWithAnimation:(BOOL)animation;

@end