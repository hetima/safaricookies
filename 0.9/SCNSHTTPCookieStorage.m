//
//  SPNSHTTPCookieStorage.m
//  SafariCookies
//
//  Created by John R Chang on 2005-12-08.
//  Modified by Russell Gray - www.sweetpproductions.com  April 09
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import "Constants.h"
#import "SCNSHTTPCookieStorage.h"
#import "SCController.h"
#import "SCLogFile.h"


@implementation SCNSHTTPCookieStorage

- (void)setCookies:(NSArray *)cookies forURL:(NSURL *)theURL mainDocumentURL:(NSURL *)mainDocumentURL
{	
	NSBundle *thisBundle = [NSBundle bundleForClass: [self class]];
			
//	[SCLogFile log:(@"setCookies:%@ forURL:%@ mainDocumentURL:%@", [cookies description], [theURL description], [mainDocumentURL description])];

	NSString * theDomain = [theURL host];		// used in default_behavior
	if (theURL != nil)
		goto default_behavior;

	/*
		!NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain -> default
	*/
	NSHTTPCookieAcceptPolicy policy = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookieAcceptPolicy];
	if (policy == NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain)
	{
		NSString * mainDocumentHostname = [mainDocumentURL host];
		NSString * hostname = [theURL host];
		BOOL shouldAcceptCookie = [mainDocumentHostname isEqualToString:hostname];
		if (shouldAcceptCookie == YES)
		{
			goto default_behavior;
		}
		if (shouldAcceptCookie == NO)
		{
			goto deny_behaviour;
		}
	}
	if (policy != NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain)
	{
		goto alternate_behaviour;
	}
	
default_behavior:
	[SCLogFile log:[NSString stringWithFormat:NSLocalizedStringFromTableInBundle(@"Cookie (%@): Pass-through", nil, thisBundle, nil), theDomain]];
	[super setCookies:cookies forURL:theURL mainDocumentURL:mainDocumentURL];
	return;
	
deny_behaviour:
	[SCLogFile log:[NSString stringWithFormat:NSLocalizedStringFromTableInBundle(@"Cookie (%@): DENIED", nil, thisBundle, nil), theDomain]];
	return;
		
	//used when cookieAcceptPolicy is set as "never", or "always" - so we dont fill the log with pointless entries
alternate_behaviour:
	return;
}

@end
