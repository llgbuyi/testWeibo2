//
//  AccountProvider.m
//  testWeibo2
//
//  Created by lili on 14-12-29.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "AccountProvider.h"
#import "AccountItem.h"

@implementation AccountProvider

- (id)provide:(JSObjectionInjector *)context arguments:(NSArray *)arguments {
    
    AccountItem *item = [[AccountItem alloc] init];
    if ([arguments[0] isKindOfClass:[NSDictionary class]]){
        NSDictionary *dict = (NSDictionary *)arguments[0];
        item.uid = dict[@"uid"];
        item.token = dict[@"accessToken"];
        item.accountType = weibo;//[(arguments[0])[@"accountType"] integerValue];
    }
    return item;
}
@end
