%hook CKSMSService

static	NSString *originalText;
static	NSString *settingsSignature;
static	NSString *userSignature;
static	NSString *returnText;
static	NSString *settingsPlistPath;
static	NSMutableDictionary *settingsDictionary;
static	BOOL useSig;

-(id)_newSMSMessageWithText:(id)text forConversation:(id)conversation {
	settingsPlistPath = @"/var/mobile/Library/Preferences/com.legendcoders.SMSSignature.plist";
	settingsDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPlistPath];
	useSig = [[settingsDictionary objectForKey:@"sigOnOff"] boolValue];
		
	if(useSig) {
		originalText = text;
		settingsSignature = [settingsDictionary objectForKey:@"sigtext"];
		userSignature = @"\n";
		userSignature = [userSignature stringByAppendingString:settingsSignature];
		returnText = [originalText stringByAppendingString:userSignature];
		text = returnText;
	}

		
	[originalText release];	
	[settingsSignature release];	
	[userSignature release];	
	[returnText release];	
	[settingsDictionary release];
	[settingsDictionary release];
return %orig;
}
%end