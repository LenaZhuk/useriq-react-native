
#import "UseriqReactNative.h"
#import <RCTLog.h>
#import <UserIQ/UserIQ.h>

@implementation UseriqReactNative

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE(UseriqReactNative);

RCT_EXPORT_METHOD(init:(NSString *)apiKey){
    self.apiKey = apiKey;
    RCTLogInfo(@"\n*****SDK initialized with apiKey: %@*****",apiKey);
    resolve(@"successful UserIQ SDK initialization");
}

RCT_EXPORT_METHOD(setUser:(NSString *)userId
                  name:(NSString *)name
                  email:(NSString *)email
                  accountId:(int)accId
                  accountName:(NSString *)accName
                  signupDate:(NSString *)signupDate
                  andParameters:(NSDictionary *)parameters) {
    RCTLogInfo(@"\n*****SDK setUser is successful with apiKey: %@\nuserId: %@\nname: %@\nemail: %@\naccount Id: %d\naccount Name: %@\nsignup Date: %@\nparameters: %@*****",self.apiKey,userId,name,email,accId,accName,signupDate,parameters);
    NSString *apiKeyMissing = @"apiKey Missing";
    NSAssert((![self.apiKey isEqualToString:@""]&&self.apiKey), apiKeyMissing);
    [[UserIQSDK sharedInstance] initWithAPIKey:self.apiKey
                                        userId:userId
                                          name:name
                                         email:email
                                     accountId:accId
                                   accountName:accName
                                    signupDate:signupDate
                                 andParameters:parameters];
    resolve(@"successful UserIQ SDK setUser Successful");
}

RCT_EXPORT_METHOD(disableFAB) {
    [[UserIQSDK sharedInstance] disableFAB];
}

RCT_REMAP_METHOD(showCtxHelp, resolve:(RCTPromiseResolveBlock)resolve){
    BOOL shown = [[UserIQSDK sharedInstance] showCtxHelp];
    resolve([NSNumber numberWithBool:shown]);
}

RCT_EXPORT_METHOD(showHelpCentre){
    [[UserIQSDK sharedInstance] showHelpCentre];
}

RCT_EXPORT_METHOD(setHost:(NSString *)host) {
    [[UserIQSDK sharedInstance] setHost:host];
}

@end
  
