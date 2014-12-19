#import "SuperUIButton.h"
#import "UIImage+HaxegonMasking.h"
#import "UIView+FrameUtil.h"
#import "UIImage-Extensions.h"
#import "CalUtil.h"
#import "ImgUtil.h"

@implementation SuperUIButton
@synthesize bgColor;
@synthesize borderColor;
@synthesize borderWidth;
@synthesize cornerRadius;
@synthesize textColor;
@synthesize textFont;
@synthesize label = _label;
@synthesize bedge;
@synthesize extra;
@synthesize img = _img;

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"highlighted"];
}

- (void)awakeFromNib
{
    [self build];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self build];
    }
    return self;
}

- (void)build
{
    self.backgroundColor = [UIColor clearColor];
    extra = [NSMutableDictionary dictionary];
    [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:NULL];
    self.style = SuperUIButtonStyleRect;
    self.imgPos = SuperUIButtonImgPosLeft;
    self.insetSize = 1;
    self.backgroundColor = [UIColor clearColor];
    self.cornerRadius = 0;
    self.bgColor = [UIColor clearColor];
    self.borderColor = [UIColor clearColor];
    self.imgPad = 4;
    self.opaque = NO;
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.indicator.frame = CGRectMake(0, 0, 20, 20);
    [self addSubview:self.indicator];
    [self hideLoading];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay];
}

- (NSString *)label
{
    return _label;
}

- (void)setLabel:(NSString *)label
{
    _label = label;
    [self setNeedsDisplay];
    [self setNeedsLayout];
}

- (UIImage *)img
{
    return _img;
}

- (void)setImg:(UIImage *)img
{
    _img = img;
    if (self.imgSize > 0)
    {
        _img = [ImgUtil reize:img scaledTosize:CGSizeMake(self.imgSize, self.imgSize)];
    }
    self.imageView.image = _img;
    [self setNeedsDisplay];
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.img)
    {
        self.imageView.image = self.img;
        self.imageView.hidden = NO;
        if (self.imgPos == SuperUIButtonImgPosCenter)
        {
            self.imageView.contentMode = UIViewContentModeCenter;
            self.imageView.frame = CGRectInset(self.bounds, self.insetSize, self.insetSize);
        }
        if (self.imgPos == SuperUIButtonImgPosCenterFit)
        {
            self.imageView.contentMode = UIViewContentModeScaleAspectFit;
            self.imageView.frame = CGRectInset(self.bounds, self.insetSize, self.insetSize);
        }
        if (self.imgPos == SuperUIButtonImgPosCenterFill)
        {
            self.imageView.contentMode = UIViewContentModeScaleToFill;
            self.imageView.frame = CGRectInset(self.bounds, self.insetSize, self.insetSize);
        }
        if (self.imgPos == SuperUIButtonImgPosCenterCrop)
        {
            self.imageView.contentMode = UIViewContentModeScaleAspectFill;
            self.imageView.frame = CGRectInset(self.bounds, self.insetSize, self.insetSize);
        }
        if (self.imgPos == SuperUIButtonImgPosUp)
        {
            CGSize imageSize = self.img.size;
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -imageSize.height, 0);
            self.imageView.frame = CGRectMake(self.bounds.size.width / 2 - imageSize.width / 2, self.bounds.size.height / 2 - imageSize.height - self.imgPad, imageSize.width, imageSize.height);
        }
        if (self.imgPos == SuperUIButtonImgPosLeft)
        {
            CGSize imageSize = self.img.size;
            self.titleEdgeInsets = UIEdgeInsetsMake(0, imageSize.width, 0, 0);
            self.imageView.frame = CGRectMake(self.imgPad, self.bounds.size.height / 2 - imageSize.height / 2, imageSize.width, imageSize.height);
        }
        if (self.imgPos == SuperUIButtonImgPosLeftOfText)
        {
            CGSize imageSize = self.img.size;
            self.titleEdgeInsets = UIEdgeInsetsMake(0, imageSize.width + self.imgPad, 0, 0);
            CGFloat totalWidth = self.titleLabel.width + imageSize.width + self.imgPad;
            self.imageView.frame = CGRectMake(self.bounds.size.width / 2 - totalWidth / 2, self.bounds.size.height / 2 - imageSize.height / 2, imageSize.width, imageSize.height);
        }
    }
    else
    {
        self.imageView.hidden = YES;
    }
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(context, YES);

    [self setTitle:self.label forState:UIControlStateNormal];
    [self setTitleColor:textColor forState:UIControlStateNormal];
    self.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = textFont;
    if (self.style == SuperUIButtonStyleRect)
    {
        CGRect box = CGRectInset(self.bounds, self.insetSize, self.insetSize);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:box cornerRadius:cornerRadius];
        path.lineWidth = borderWidth;
        [borderColor setStroke];
        [path stroke];
        [bgColor setFill];
        [path fill];
    }
    else if (self.style == SuperUIButtonStyleHexagon)
    {
        UIBezierPath *hexagonPath = [UIImage bezierPathWithHexagonInRect:self.bounds];
        [borderColor setStroke];
        [hexagonPath stroke];
        [bgColor setFill];
        [hexagonPath fill];
    }
    else if (self.style == SuperUIButtonStyleCircle)
    {
        CGRect box = CGRectInset(self.bounds, self.insetSize, self.insetSize);
        UIBezierPath *ballBezierPath = [UIBezierPath bezierPathWithOvalInRect:box];
        [borderColor setStroke];
        [ballBezierPath stroke];
        [bgColor setFill];
        [ballBezierPath fill];
    }
    else
    {
        self.backgroundColor = bgColor;
    }
    [super drawRect:rect];
    if (bedge && self.bedgeColor)
    {
        UIColor *color = self.bedgeColor;
        CGRect box = CGRectMake(self.titleLabel.frameEndPoint.x, self.titleLabel.frame.origin.y - 4, 4, 4);
        UIBezierPath *ballBezierPath = [UIBezierPath bezierPathWithOvalInRect:box];
        [color setStroke];
        [ballBezierPath stroke];
        [color setFill];
        [ballBezierPath fill];
    }
    if (self.highlighted)
    {
        self.alpha = 0.6;
    }
    else
    {
        self.alpha = 1.0;
    }
}

- (CGSize)calSize
{
    CGFloat width = [CalUtil calWidth:self.label font:textFont width:MAXFLOAT min:0];
    if (self.imgPos == SuperUIButtonImgPosLeft)
    {
        width += self.img.size.width;
    }
    if (self.imgPos == SuperUIButtonImgPosLeftOfText)
    {
        width += self.img.size.width + 4;
    }
    return CGSizeMake(width, self.frame.size.height);
}

- (void)showLoading
{
    [self.indicator centerX:self];
    [self.indicator centerY:self];
    self.indicator.hidden = NO;
    [self.indicator startAnimating];
}

- (void)hideLoading
{
    self.indicator.hidden = YES;
    [self.indicator stopAnimating];
}

@end