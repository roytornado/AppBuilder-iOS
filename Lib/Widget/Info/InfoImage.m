#import "InfoImage.h"

@implementation InfoImage {
    FullSizeImageCell *my_cell;
}
@synthesize url;

+ (InfoImage *)createToSection:(InfoSection *)parent WithUrl:(NSString *)_url
{
    InfoImage *obj = [[InfoImage alloc] init];

    obj.url = _url;

    [parent.cells addObject:obj];
    return obj;
}

- (NSString *)getCellId
{
    return @"InfoImageCell";
}

- (UITableViewCell *)create
{
    UINib   *cellNib = [UINib nibWithNibName:@"FullSizeImageCell" bundle:nil];
    NSArray *bundleObjects = [cellNib instantiateWithOwner:self options:nil];

    my_cell = [bundleObjects objectAtIndex:0];
    return my_cell;
}

- (void)fill
{
}

- (CGFloat)getHeight
{
    return 140;
}

@end