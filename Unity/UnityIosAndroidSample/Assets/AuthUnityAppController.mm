#import "UnityAppController.h"
@interface AuthUnityAppController : UnityAppController
void UnitySendMessage( const char * className, const char * methodName, const char * param );
@end
@implementation AuthUnityAppController
- (BOOL) application:(UIApplication*)application
            openURL:(NSURL*)url
            sourceApplication:(NSString*)sourceApplication
            annotation:(id)annotation
{
    NSLog(@"url received %@",url);
    // call the parent implementation
    [super application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!url)
        return NO;

    const char * queryString = [url.query UTF8String];
    NSString *nsQueryString = [NSString stringWithUTF8String:queryString];

    if ([url.scheme isEqualToString:@"com.identityserver.sample"]) {
        if ([url.host isEqualToString:@"auth"]) {
            NSLog(@"received auth reply");
            UnitySendMessage("SignInCanvas", "OnAuthReply", queryString);
        } else {
            NSLog(@"received unexpected url host: [%@]", url.host);
        }
    } else {
        NSLog(@"received unexpected url scheme: [%@]", url.scheme);
    }

    return YES;
}
@end
IMPL_APP_CONTROLLER_SUBCLASS(AuthUnityAppController)
