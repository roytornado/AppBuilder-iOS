#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "InfoBase.h"
#import "InfoSection.h"
#import "InputTextCell.h"

typedef enum {
    InfoInputTextTypeDefault,
    InfoInputTextTypeUserId,
    InfoInputTextTypeName,
    InfoInputTextTypeEmail,
    InfoInputTextTypePhone,
} InfoInputTextType;

@interface InfoInputText : NSObject <InfoBase, UITextFieldDelegate>

@property NSString          *key;
@property (nonatomic,getter= getValue) NSString          *value;
@property NSString          *hint;
@property InfoInputTextType type;

+ (InfoInputText *)createToSection:(InfoSection *)parent WithKey:(NSString *)_key WithValue:(NSString *)_value WithType: (InfoInputTextType) _type;
- (void)focus;

@end