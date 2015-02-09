#import "InfoInputLongText.h"

@implementation InfoInputLongText

+ (void)initialize {
	[InfoInputLongText appearance].backgroundColor = [UIColor whiteColor];
	[InfoInputLongText appearance].widthKey = 80;
	[InfoInputLongText appearance].padOutter = 10;
	[InfoInputLongText appearance].padInner = 10;
	[InfoInputLongText appearance].keyColor = [UIColor darkGrayColor];
	[InfoInputLongText appearance].keyFont = [UIFont systemFontOfSize:14];
	[InfoInputLongText appearance].valueColor = [UIColor darkGrayColor];
	[InfoInputLongText appearance].valueFont = [UIFont systemFontOfSize:14];
}

- (instancetype)initWithInfoVertical:(InfoVerticalScrollView *)container key:(NSString *)key value:(NSString *)value {
	self = [self init];
	self.key = key;
	self.value = value;
	[container addSubview:self];
	return self;
}

- (id)init {
	self = [super init];

	if (self) {
		self.keyView = [[UILabel alloc] init];
		[self addSubview:self.keyView];

		self.valueView = [[UITextView alloc] init];
		self.valueView.delegate = self;
		[self addSubview:self.valueView];

		[self config];
	}

	return self;
}

- (void)config {
	self.valueView.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.valueView.autocorrectionType = UITextAutocorrectionTypeNo;
	self.inputLimit = 10000;
}

- (void)setValue:(NSString *)value {
	_value = value;
	self.valueView.text = _value;
}

- (CGFloat)layout:(CGFloat)contentWidth {
	self.keyView.textColor = self.keyColor;
	self.keyView.font = self.keyFont;
	self.valueView.textColor = self.valueColor;
	self.valueView.font = self.valueFont;

	self.keyView.text = self.key;
	//self.valueView.text = self.value;
	//self.valueView.placeholder = self.hint;

	CGFloat wValue = contentWidth - self.widthKey - self.padOutter * 2 - self.padInner;

	CGSize sizeKey = [self.keyView sizeThatFits:CGSizeMake(self.widthKey, HUGE_VALF)];
	CGSize sizeValue = [self.valueView sizeThatFits:CGSizeMake(wValue, HUGE_VALF)];

	self.keyView.frame = CGRectMake(self.padOutter, self.padOutter, self.widthKey, sizeKey.height);
	self.valueView.frame = CGRectMake(self.keyView.frameEndPoint.x + self.padInner, self.padOutter, wValue, sizeValue.height);
	return MAX(self.keyView.height, self.valueView.height) + self.padOutter * 2;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)string {
	NSUInteger newLength = [textView.text length] + [string length] - range.length;
	if (self.charSet) {
		if (newLength > self.inputLimit) {
			return NO;
		}

		NSCharacterSet *validCharSet = [[NSCharacterSet characterSetWithCharactersInString:self.charSet] invertedSet];
		NSString *filtered = [[string componentsSeparatedByCharactersInSet:validCharSet] componentsJoinedByString:@""];
		return [string isEqualToString:filtered];
	}
	if (newLength > self.inputLimit) {
		return NO;
	}
	return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
	self.value = textView.text;
	[[NSNotificationCenter defaultCenter] postNotificationName:kInfoNotificationSizeDidChanged object:nil];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
	[[NSNotificationCenter defaultCenter] postNotificationName:kInfoNotificationViewDidFocus object:self];
}

- (void)focus {
	[self.valueView becomeFirstResponder];
}

@end
