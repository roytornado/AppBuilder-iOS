#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "InfoBase.h"
#import "InfoSection.h"
#import "FullSizeImageCell.h"

@interface InfoImage : NSObject <InfoBase>

@property NSString *url;

+ (InfoImage *)createToSection:(InfoSection *)parent WithUrl:(NSString *)_url;

@end