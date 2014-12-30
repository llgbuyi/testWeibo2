//
//  ListItemProvider.m
//  testWeibo2
//
//  Created by lili on 14-12-30.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "ListItem.h"
#import "ListItemProvider.h"

@implementation ListItemProvider

- (id)provide:(JSObjectionInjector *)context arguments:(NSArray *)arguments {
    
    ListItem *item = [[ListItem alloc] init];
    
    if ([arguments[0] isKindOfClass:[NSDictionary class]]) {
        item.headImage = (arguments[0])[@"profile_image_url"];
        item.nickName = (arguments[0])[@"screen_name"];
    }
    
    return item;
}

+ (NSArray *)createArrayWithArguments:(NSArray *)arguments{
    NSMutableArray *listItemArr = [[NSMutableArray alloc] init];
    for(NSDictionary *dictItem in arguments){
        ListItem *item = [[JSObjection defaultInjector] getObject:[ListItem class] argumentList:@[dictItem]];
        
        if(item) {
            [listItemArr addObject:item];
        }
    }
    return [listItemArr copy];
}

@end
