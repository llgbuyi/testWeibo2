//
//  WeiboLogin.h
//  testWeibo2
//
//  Created by lili on 14-12-29.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FinishBlock)(NSArray *result, NSError *error);

@interface WeiboLogin : NSObject

+ (instancetype)shareInstance;

+ (void)handleOpenUrl:(NSURL *)argURL;

+ (void)request;

- (void)requestUserWithFinishBlock:(FinishBlock)argFinishBlock;

- (void)requestFriendsWithFinishBlock:(FinishBlock)argFinishBlock;


@end
