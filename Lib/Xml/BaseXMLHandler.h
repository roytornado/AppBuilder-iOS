#import <UIKit/UIKit.h>

@interface BaseXMLHandler : NSObject <NSXMLParserDelegate>{
	NSMutableString *currentElementValue;
	NSMutableArray	*nodeStack;
}

- (BOOL)isInside:(NSString *)parentName;
- (BOOL)isNode:(NSString *)tag;
- (BOOL)isParent:(NSString *)parentName;

@end