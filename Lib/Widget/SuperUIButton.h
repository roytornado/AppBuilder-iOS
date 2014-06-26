#import <UIKit/UIKit.h>


typedef NS_ENUM (NSInteger, SuperUIButtonStyle){
	SuperUIButtonStyleRect,
	SuperUIButtonStyleHexagon,
	SuperUIButtonStyleCircle,
};

typedef NS_ENUM (NSInteger, SuperUIButtonImgPos){
	SuperUIButtonImgPosUp,
	SuperUIButtonImgPosLeft,
	SuperUIButtonImgPosCenter,
	SuperUIButtonImgPosCenterFill,
	SuperUIButtonImgPosCenterFit,
	SuperUIButtonImgPosCenterCrop,
	SuperUIButtonImgPosLeftOfText,
};


@interface SuperUIButton : UIButton

@property SuperUIButtonStyle style;
@property SuperUIButtonImgPos imgPos;
@property CGFloat insetSize;
@property UIColor* bgColor;
@property UIColor* borderColor;
@property CGFloat borderWidth;
@property CGFloat cornerRadius;
@property UIColor* textColor;
@property UIFont* textFont;
@property UIImage* img;
@property UIColor* imgColorMask;
@property CGFloat imgSize;
@property CGFloat imgPad;
@property NSString* label;
@property BOOL bedge;
@property UIColor* bedgeColor;
@property UIActivityIndicatorView* indicator;

@property NSMutableDictionary* extra;

- (CGSize)calSize;
- (void)showLoading;
- (void)hideLoading;

@end
