#import <Foundation/Foundation.h>

@protocol InfoBase <NSObject>

- (NSString *)getCellId;
- (UITableViewCell *)create;
- (void)fill;
- (CGFloat)getHeight;

@optional
- (NSString *)getTag;

@end