#import "BaseXMLHandler.h"

@implementation BaseXMLHandler

- (id)init
{
	self = [super init];

	if (self) {
		nodeStack = [NSMutableArray array];
	}

	return self;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
	[nodeStack removeAllObjects];
}

- (void)parser		:(NSXMLParser *)parser didStartElement:(NSString *)elementName
		namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
		attributes	:(NSDictionary *)attributeDict
{
	[nodeStack addObject:elementName];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if (!currentElementValue) {
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	} else {
		[currentElementValue appendString:string];
	}
}

- (void)parser		:(NSXMLParser *)parser didEndElement:(NSString *)elementName
		namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	[nodeStack removeLastObject];
	currentElementValue = nil;
}

- (BOOL)isInside:(NSString *)parentName
{
	return [nodeStack containsObject:parentName];
}

- (BOOL)isNode:(NSString *)tag
{
	NSMutableString *temp = [NSMutableString stringWithString:@""];

	for (NSString *node in nodeStack) {
		[temp setString:[temp stringByAppendingString:@"."]];
		[temp setString:[temp stringByAppendingString:node]];
	}

	[temp setString:[temp stringByAppendingString:@"."]];

	if ([temp hasSuffix:tag]) {
		return YES;
	}

	return NO;
}

- (BOOL)isParent:(NSString *)parentName
{
	if ([nodeStack count] >= 2) {
		NSString *parentNode = [nodeStack objectAtIndex:[nodeStack count] - 2];
		return [parentNode isEqualToString:parentName];
	} else {
		return false;
	}
}

@end