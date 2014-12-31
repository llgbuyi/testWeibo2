//
//  WeiboLogin.m
//  testWeibo2
//
//  Created by lili on 14-12-29.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "WeiboLogin.h"
#import "ListItemProvider.h"



typedef enum {
    requestUserInfo = 1001,
    requestFriends,
}RequestTag;

@interface WeiboLogin()<WBHttpRequestDelegate>

@property (nonatomic, copy) FinishBlock callbackBlock;

@end

@implementation WeiboLogin

objection_register_singleton(WeiboLogin);


+ (instancetype)shareInstance {
    static WeiboLogin *weiboLogin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weiboLogin = [[WeiboLogin alloc] init];
    });
    return weiboLogin;
}


+ (void)handleOpenUrl:(NSURL *)argURL{
    [WeiboSDK handleOpenURL:argURL delegate:(id<WeiboSDKDelegate>)self];
}

+ (void)load{
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kAppKey];
}

+ (void)request {
    
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kRedirectURI;
    request.scope = @"";
    request.userInfo = @{};
    [WeiboSDK sendRequest:request];
}

+ (void)didReceiveWeiboResponse:(WBBaseResponse *)response{

    if ([response isKindOfClass:WBAuthorizeResponse.class]) {
        if (response.statusCode == WeiboSDKResponseStatusCodeSuccess) {
            NSString *uid = [(WBAuthorizeResponse *)response userID];
            NSString *token = [(WBAuthorizeResponse *)response accessToken];
            [[NSUserDefaults standardUserDefaults] setObject:uid forKey:userIDKey];
            [[NSUserDefaults standardUserDefaults] setObject:token forKey:userTokenKey];
            NSLog(@"uid:%@, token:%@", uid, token);
            
            id<AccountManagerProtocol> manager = [[JSObjection defaultInjector] getObject:@protocol(AccountManagerProtocol)];
            NSDictionary *accountItemDict = @{@"uid" : uid,
                                              @"accessToken" : token,
                                              @"accountType" : @(weibo)};
            id<AccountItemProtocol> accountItem = [[JSObjection defaultInjector] getObject:[AccountItem class] argumentList:@[accountItemDict]];
            manager.currentAccount = accountItem;
        }
        else {
            NSLog(@"授权失败");
        }
        
    }
}

- (void)requestUserWithFinishBlock:(FinishBlock)argFinishBlock {
    NSString *url1 = @"https://api.weibo.com/2/users/show.json";
    
    NSString *ID = [[NSUserDefaults standardUserDefaults] objectForKey:userIDKey];
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:userTokenKey];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          ID, @"uid",nil];
    
    [WBHttpRequest requestWithAccessToken:token url:url1 httpMethod:@"GET" params:dict delegate:self withTag:@"requestUser"];
    self.callbackBlock = argFinishBlock;

}

- (void)requestFriendsWithFinishBlock:(FinishBlock)argFinishBlock {
    NSString *url = @"https://api.weibo.com/2/friendships/friends.json";

    NSString *ID = [[NSUserDefaults standardUserDefaults] objectForKey:userIDKey];
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:userTokenKey];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          ID, @"uid",nil];
    [WBHttpRequest requestWithAccessToken:token url:url httpMethod:@"GET" params:dict delegate:self withTag:@"requestFriends"];
    self.callbackBlock = argFinishBlock;
}

- (void)requestPublicWeiboWithFinishBlock:(FinishBlock)argFinishBlock {
    NSString *url = @"https://api.weibo.com/2/statuses/public_timeline.json";
    NSString *ID = [[NSUserDefaults standardUserDefaults] objectForKey:userIDKey];
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:userTokenKey];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          ID, @"uid",nil];
    [WBHttpRequest requestWithAccessToken:token url:url httpMethod:@"GET" params:dict delegate:self withTag:@"requestPublic"];
    self.callbackBlock = argFinishBlock;
}


- (void)request:(WBHttpRequest *)request didFinishLoadingWithDataResult:(NSData *)data {
    
    if ([request.tag isEqualToString: @"requestUser"]) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *usersArr = @[dict];
        NSArray * resultArr = [ListItemProvider createArrayWithArguments:usersArr];
        if(self.callbackBlock) {
            self.callbackBlock(resultArr, nil);
        }
    }
    
    else if ([request.tag isEqualToString:@"requestFriends"]) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *usersArr = [dict objectForKey:@"users"];
            NSArray * resultArr = [ListItemProvider createArrayWithArguments:usersArr];
            if(self.callbackBlock) {
                self.callbackBlock(resultArr, nil);
            }
    }
    else if ([request.tag isEqualToString: @"requestPublic"]){
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *usersArr = [dict objectForKey:@"statuses"];
        NSArray * resultArr = [ListItemProvider createArrayWithArguments:usersArr];
        if(self.callbackBlock) {
            self.callbackBlock(resultArr, nil);
        }
    }
}

- (void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result
{
 
}

- (void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error {
    
}
@end
