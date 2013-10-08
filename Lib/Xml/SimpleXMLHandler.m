#import "SimpleXMLHandler.h"

@implementation SimpleXMLHandler

@synthesize result, tag;

+ (NSString *)parse:(NSString *)source forTag:(NSString *)tag
{
	NSData		*data		= [source dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
	NSXMLParser *xmlParser	= [[NSXMLParser alloc] initWithData:data];

	SimpleXMLHandler *parser = [[SimpleXMLHandler alloc] init];

	parser.tag = tag;
	[xmlParser setDelegate:parser];
	BOOL success = [xmlParser parse];

	if (success) {
		return parser.result;
	} else {
		return nil;
	}
}

- (id)init
{
	self = [super init];

	if (self) {
		result = @"";
	}

	return self;
}

- (void)parser		:(NSXMLParser *)parser didStartElement:(NSString *)elementName
		namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
		attributes	:(NSDictionary *)attributeDict
{
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
}

- (void)parser		:(NSXMLParser *)parser didEndElement:(NSString *)elementName
		namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if ([self isNode:tag]) {
		result = [currentElementValue stringByTrimmingCharactersInSet:
			[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}

	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
}

@end