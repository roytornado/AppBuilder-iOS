#import <Foundation/Foundation.h>
@class InfoGroup;
@interface InfoSection : NSObject

@property NSString			*header;
@property NSString			*footer;
@property NSMutableArray	*cells;

+ (InfoSection *)createToGroup:(InfoGroup *)parent header:(NSString *)header footer:(NSString *)footer;

@end