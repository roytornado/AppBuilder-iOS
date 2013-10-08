#import <Foundation/Foundation.h>
@class InputText;

@interface InputManager : NSObject

- (void)addInput:(InputText *)input;
- (BOOL)checkFocus:(InputText *)input;

@end