//
//  AccountModule.m
//  testWeibo2
//
//  Created by lili on 14-12-29.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "AccountModule.h"
#import "AccountProvider.h"
#import "AccountItem.h"
#import "AccountManager.h"

@implementation AccountModule

- (void)configure {
    [self bindProvider:[[AccountProvider alloc] init] toClass:[AccountItem class]];
    [self bindClass:[AccountItem class] toProtocol:@protocol(AccountItemProtocol)];
    [self bindClass:[AccountManager class] toProtocol:@protocol(AccountManagerProtocol)];
}

@end
