#import "InputManager.h"
#import "InputText.h"

@implementation InputManager {
	NSMutableArray *list;
}

- (id)init
{
	self = [super init];

	if (self) {
		list = [NSMutableArray array];
	}

	return self;
}

- (void)addInput:(InputText *)input
{
	[list addObject:input];
}

- (BOOL)checkFocus:(InputText *)input
{
	for (int i = 0; i < list.count; i++) {
		InputText *inputInList = [list objectAtIndex:i];

		if (inputInList == input) {
			[inputInList.view resignFirstResponder];

			if (i + 1 < list.count) {
				InputText *inputInListNext = [list objectAtIndex:i + 1];
				[inputInListNext.view becomeFirstResponder];
			}

			if (inputInList.action) {
				inputInList.action(inputInList);
			}
		}
	}

	return YES;
}

@end