#import <Foundation/Foundation.h>
#import "InputManager.h"

typedef enum {
	InputTextCapAllUp,
	InputTextCapAllLow,
	InputTextCapAsIt
} InputTextCapType;

@class InputText;
typedef void (^ InputTextHandler)(InputText *inputText);

@interface InputText : NSObject <UITextFieldDelegate>

@property InputManager							*parent;
@property UITextField							*view;
@property InputTextCapType						capType;
@property int									max;
@property (nonatomic, copy) InputTextHandler	action;

+ (InputText *)createToManager:(InputManager *)parent view:(UITextField *)view type:(InputTextCapType)capType max:(int)max;

@end