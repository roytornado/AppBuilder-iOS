#import "InputText.h"
#import "InputManager.h"

@implementation InputText

@synthesize parent;
@synthesize view;
@synthesize capType;
@synthesize max;

+ (InputText *)createToManager:(InputManager *)parent view:(UITextField *)view type:(InputTextCapType)capType max:(int)max
{
	InputText *inputText = [[InputText alloc] init];

	inputText.parent	= parent;
	inputText.view		= view;
	inputText.capType	= capType;
	inputText.max		= max;
	view.delegate		= inputText;
	[parent addInput:inputText];
	[view addTarget:inputText action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
	return inputText;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	return [parent checkFocus:self];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	NSUInteger newLength = [textField.text length] + [string length] - range.length;

	if (newLength > max) {
		return NO;
	}

	return YES;
}

- (void)textFieldDidChange:(UITextField *)textField
{
	if (capType == InputTextCapAllUp) {
		textField.text = [textField.text uppercaseString];
	}

	if (capType == InputTextCapAllLow) {
		textField.text = [textField.text lowercaseString];
	}
}

@end