//
//  ListItemProvider.h
//  testWeibo2
//
//  Created by lili on 14-12-30.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListItemProvider : NSObject<JSObjectionProvider>

+ (NSArray *)createArrayWithArguments:(NSArray *)arguments;

@end
