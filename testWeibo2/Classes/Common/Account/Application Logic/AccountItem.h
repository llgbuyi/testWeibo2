//
//  AccountItem.h
//  testWeibo2
//
//  Created by lili on 14-12-29.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    weibo = 0,
    
} AccountType;

@interface AccountItem : NSObject

@property (nonatomic, assign)AccountType *accountType;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *uid;

@end
