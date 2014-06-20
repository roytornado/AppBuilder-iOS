#import "App.h"

@implementation App

static id sharedInstance = nil;
static NSString* lang = @"en";
static NSMutableDictionary* dictionary = nil;
static NSMutableArray* langPathList = nil;

#pragma mark Life Cycle

+ (id)me
{
	@synchronized(self){
		if(sharedInstance == nil){
			sharedInstance = [[self alloc] init];
		}
	}
	return sharedInstance;
}

- (id)init
{
	if(self = [super init]){
		[self initBase];
	}

	return self;
}

- (void)initBase {
	[App buildLangDict];
	if(![self getPref:@"lang"]){
		[self savePref:@"lang" WithValue:@"zh-Hant"];
	}else{
		lang = [self getPref:@"lang"];
		if([[self getPref:@"lang"] isEqualToString:@"en"]){
			lang = @"en";
		}
		if([[self getPref:@"lang"] isEqualToString:@"hant"]){
			lang = @"zh-Hant";
		}
	}
}

#pragma mark Languages

+ (void)buildLangDict {
	if(langPathList == nil){
		langPathList = [NSMutableArray arrayWithObjects:@"%@.base", nil];
	}

	NSArray* langList = [NSArray arrayWithObjects:@"zh-Hant",@"en",@"zh-Hans", nil];

	dictionary = [NSMutableDictionary dictionary];

	for(NSString* lang in langList){
		NSMutableDictionary* langDictionary = [NSMutableDictionary dictionary];
		[dictionary setObject:langDictionary forKey:lang];

		for(NSString* path in langPathList){
			NSString* nstmp = [NSString stringWithFormat:path, lang];
			NSString* stringsPath = [[NSBundle mainBundle] pathForResource:nstmp ofType:@"strings"];
			NSDictionary* pathDictionary = [NSDictionary dictionaryWithContentsOfFile:stringsPath];

			for(NSString* key in[pathDictionary keyEnumerator]){
				NSString* value = [pathDictionary objectForKey:key];

				if([langDictionary objectForKey:key] == nil){
					[langDictionary setObject:value forKey:key];
				}
				else {
					NSLog(@"Override String: %@", key);
					[langDictionary setObject:value forKey:key];
				}
			}
		}

		NSLog(@"String list for [%@] , Count: %lu", lang, (unsigned long)[langDictionary count]);
		for(NSString* key in[langDictionary keyEnumerator]){
			// NSLog(@"[%@]:[%@]", key, [langDictionary objectForKey:key]);
		}
	}
}

+ (void)addLangPath:(NSString*)newLangPath {
	if(langPathList == nil){
		langPathList = [NSMutableArray arrayWithObjects:@"%@.base", nil];
	}

	[langPathList addObject:newLangPath];
	[App buildLangDict];
}

+ (NSString*)getString:(NSString*)key {
	if(dictionary == nil){
		[App buildLangDict];
	}

	NSDictionary* langDictionary = [dictionary objectForKey:lang];
	return [langDictionary objectForKey:key];
}

+ (NSString*)getLang {
	return lang;
}

+ (void)changeLang:(NSString*)language {
	lang = language;
}

#pragma mark Pref

- (void)savePref:(NSString*)prefKey WithValue:(NSString*)prefValue {
	NSUserDefaults* appPrefs = [NSUserDefaults standardUserDefaults];

	[appPrefs setObject:prefValue forKey:prefKey];
	[appPrefs synchronize];
}

- (NSString*)getPref:(NSString*)prefKey {
	NSUserDefaults* appPrefs = [NSUserDefaults standardUserDefaults];
	NSString* prefValue = [appPrefs stringForKey:prefKey];

	if( prefValue && (prefValue.length > 0) ){
		return prefValue;
	}
	else {
		return nil;
	}
}

#pragma mark Devices

- (NSString*)getPackageName {
	return [[NSBundle mainBundle] bundleIdentifier];
}

- (NSString*)getDeviceId {
	NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
	NSString* deviceId = [prefs objectForKey:@"deviceId"];

	if(deviceId){
		return deviceId;
	}
	else {
		deviceId = [[NSUUID UUID] UUIDString];

		if(floor(NSFoundationVersionNumber) < NSFoundationVersionNumber_iOS_6_0){
			CFUUIDRef cfuuid = CFUUIDCreate(kCFAllocatorDefault);
			NSString* cfuuidString = (NSString*)CFBridgingRelease( CFUUIDCreateString(kCFAllocatorDefault, cfuuid) );
			deviceId = cfuuidString;
		}

		[prefs setObject:deviceId forKey:@"deviceId"];
		[prefs synchronize];
		return deviceId;
	}
}

- (NSString*)getVersionCode {
	return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString*)getVersionName {
	return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey];
}

+ (UIColor*)colorFromHexString:(NSString*)hexString {
	unsigned rgbValue = 0;
	NSScanner* scanner = [NSScanner scannerWithString:hexString];

	[scanner setScanLocation:1]; // bypass '#' character
	[scanner scanHexInt:&rgbValue];
	return [UIColor colorWithRed:( (rgbValue & 0xFF0000) >> 16 ) / 255.0 green:( (rgbValue & 0xFF00) >> 8 ) / 255.0 blue:(rgbValue & 0xFF) / 255.0 alpha:1.0];
}


@end