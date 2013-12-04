#import "FullSizeImageCell.h"

@implementation FullSizeImageCell

@synthesize img;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {}

    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    CALayer *layer = [self.img layer];
    layer.masksToBounds = YES;
    layer.cornerRadius = 10.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.img.frame = CGRectMake(10, 10, 280, 120);
}

@end