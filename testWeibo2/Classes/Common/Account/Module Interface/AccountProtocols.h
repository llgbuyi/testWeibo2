//
//  AccountProtocols.h
//  testWeibo2
//
//  Created by lili on 14-12-29.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AccountItem.h"

@protocol AccountItemProtocol <NSObject>
@end


@protocol AccountManagerProtocol <NSObject>

@property (nonatomic, strong) id<AccountItemProtocol> currentAccount;

- (void)handleOpenUrl:(NSURL *)url;
- (void)loginWithAccountType:(AccountType *)accountType;
- (void)sendToLocalService:(NSDictionary *)argDict;


@end