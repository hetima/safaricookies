#import <Cocoa/Cocoa.h>


@class SUUpdater;


@interface SCController : NSObject
{
}

+ (SCController *)sharedController;
+ (id)allocWithZone:(NSZone *)zone;
- (id)copyWithZone:(NSZone *)zone;
- (id)retain;
- (unsigned)retainCount;
- (void)release;
- (id)autorelease;
+ (NSString *)version;


+ (BOOL) domains:(NSArray *)domains containsHostname:(NSString *)hostname;
+ (NSArray *) cookiesMatchingDomains:(NSArray *)matchDomains match:(BOOL)value;
+ (void) deleteCookies:(NSArray *)deleteCookies;
+ (NSString *) siteDomainName:(NSString *)domain;


@end
