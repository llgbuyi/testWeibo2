//
//  AccountManager.m
//  testWeibo2
//
//  Created by lili on 14-12-29.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "AccountManager.h"
#import "WeiboLogin.h"


@implementation AccountManager

objection_register_singleton(AccountManager);

- (void)handleOpenUrl:(NSURL *)url {
    
    [WeiboLogin handleOpenUrl:url];
}

- (void)loginWithAccountType:(AccountType *)accountType {
    
    if (accountType == weibo) {
        [WeiboLogin request];
    }
}
- (void)sendToLocalService:(NSDictionary *)argDict {
    
}


@end
