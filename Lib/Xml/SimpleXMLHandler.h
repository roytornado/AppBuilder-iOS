#import "BaseXMLHandler.h"

@interface SimpleXMLHandler : BaseXMLHandler

@property (copy) NSString *result;
@property (copy) NSString *tag;

+ (NSString *)parse:(NSString *)source forTag:(NSString *)tag;

@end
