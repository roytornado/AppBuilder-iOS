#import <UIKit/UIKit.h>


typedef NS_ENUM (NSInteger, SuperUIButtonStyle) {
    SuperUIButtonStyleNone,
    SuperUIButtonStyleRect,
    SuperUIButtonStyleHexagon,
    SuperUIButtonStyleCircle,
};

typedef NS_ENUM (NSInteger, SuperUIButtonImgPos) {
    SuperUIButtonImgPosUp,
    SuperUIButtonImgPosLeft,
    SuperUIButtonImgPosRight,
    SuperUIButtonImgPosCenter,
    SuperUIButtonImgPosCenterFill,
    SuperUIButtonImgPosCenterFit,
    SuperUIButtonImgPosCenterCrop,
    SuperUIButtonImgPosLeftOfText,
    SuperUIButtonImgPosRightOfText,
};


@interface SuperUIButton : UIButton

@property SuperUIButtonStyle style;
@property SuperUIButtonImgPos imgPos;
@property CGFloat insetSize;
@property UIColor *bgColor;
@property NSArray *bgGradientColor;
@property UIColor *borderColor;
@property CGFloat borderWidth;
@property CGFloat cornerRadius;
@property UIColor *textColor;
@property UIFont *textFont;
@property UIImage *img;
@property UIColor *imgColorMask;
@property CGFloat imgSize;
@property CGFloat imgPad;
@property NSString *label;
@property BOOL bedge;
@property UIColor *bedgeColor;
@property UIActivityIndicatorView *indicator;

@property NSMutableDictionary *extra;

- (CGSize)calSize;
- (void)showLoading;
- (void)hideLoading;

@end