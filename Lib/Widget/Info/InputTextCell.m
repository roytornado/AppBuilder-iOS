#import "InputTextCell.h"

@implementation InputTextCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.detailTextLabel.frame = CGRectMake(self.detailTextLabel.frame.origin.x
                                               , self.detailTextLabel.frame.origin.y + 10, self.detailTextLabel.frame.size.width, self.detailTextLabel.frame.size.height);
}

@end
