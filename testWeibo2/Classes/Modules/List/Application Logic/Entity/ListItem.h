//
//  ListItem.h
//  testWeibo2
//
//  Created by lili on 14-12-30.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListItem : NSObject

@property(nonatomic, strong) NSString *uid;
@property(nonatomic, strong) NSString *headImage;
@property(nonatomic, strong) NSString *nickName;
@property(nonatomic, strong) NSString *contentWeibo;

@end
