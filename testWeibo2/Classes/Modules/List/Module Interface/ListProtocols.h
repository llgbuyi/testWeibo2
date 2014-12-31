//
//  ListViewControllerProtocols.h
//  testWeibo2
//
//  Created by lili on 14-12-29.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ListViewControllerProtocol <NSObject>

@property (assign, nonatomic) BOOL buttonType;

@end

@protocol listItemProtocol <NSObject>

@property(nonatomic, strong) NSString *headImage;
@property(nonatomic, strong) NSString *nickName;

+ (NSArray *)createArrayWithArguments:(NSDictionary *)arguments;

@end