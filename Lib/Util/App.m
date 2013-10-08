#import "App.h"

@implementation App {
	NSString			*currentLang;
	NSMutableDictionary *dictionary;
	NSMutableArray		*langPathList;
}

#pragma mark Life Cycle

+ (id)me
{
	static App *sharedInstance = nil;

	@synchronized(self) {
		if (sharedInstance == nil) {
			sharedInstance = [[self alloc] init];
		}
	}
	return sharedInstance;
}

- (id)init
{
	if (self = [super init]) {
		currentLang = @"zh-Hant";
		[self buildLangDict];
	}

	return self;
}

#pragma mark Languages

- (void)buildLangDict
{
	if (langPathList == nil) {
		langPathList = [NSMutableArray arrayWithObjects:@"%@.base", nil];
	}

	NSArray *langList = [NSArray arrayWithObjects:@"zh-Hant", nil];

	dictionary = [NSMutableDictionary dictionary];

	for (NSString *lang in langList) {
		NSMutableDictionary *langDictionary = [NSMutableDictionary dictionary];
		[dictionary setObject:langDictionary forKey:lang];

		for (NSString *path in langPathList) {
			NSString		*nstmp			= [NSString stringWithFormat:path, lang];
			NSString		*stringsPath	= [[NSBundle mainBundle] pathForResource:nstmp ofType:@"strings"];
			NSDictionary	*pathDictionary = [NSDictionary dictionaryWithContentsOfFile:stringsPath];

			for (NSString *key in [pathDictionary keyEnumerator]) {
				NSString *value = [pathDictionary objectForKey:key];

				if ([langDictionary objectForKey:key] == nil) {
					[langDictionary setObject:value forKey:key];
				} else {
					NSLog(@"Override String: %@", key);
					[langDictionary setObject:value forKey:key];
				}
			}
		}

		NSLog(@"String list for [%@] , Count: %d", lang, (int)[langDictionary count]);

		for (NSString *key in [langDictionary keyEnumerator]) {
			// NSLog(@"[%@]:[%@]", key, [langDictionary objectForKey:key]);
		}
	}
}

- (void)addLangPath:(NSString *)newLangPath
{
	if (langPathList == nil) {
		langPathList = [NSMutableArray arrayWithObjects:@"%@.base", nil];
	}

	[langPathList addObject:newLangPath];
	[self buildLangDict];
}

- (NSString *)getString:(NSString *)key
{
	if (dictionary == nil) {
		[self buildLangDict];
	}

	NSDictionary *langDictionary = [dictionary objectForKey:currentLang];
	return [langDictionary objectForKey:key];
}

#pragma mark Pref

- (void)savePref:(NSString *)prefKey WithValue:(NSString *)prefValue
{
	NSUserDefaults *appPrefs = [NSUserDefaults standardUserDefaults];

	[appPrefs setObject:prefValue forKey:prefKey];
	[appPrefs synchronize];
}

- (NSString *)getPref:(NSString *)prefKey
{
	NSUserDefaults	*appPrefs	= [NSUserDefaults standardUserDefaults];
	NSString		*prefValue	= [appPrefs stringForKey:prefKey];

	if (prefValue && (prefValue.length > 0)) {
		return prefValue;
	} else {
		return nil;
	}
}

@end