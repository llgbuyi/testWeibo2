//
//  ListModule.m
//  testWeibo2
//
//  Created by lili on 14-12-29.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "ListModule.h"
#import "ListProtocols.h"
#import "ListViewController.h"
#import "ListViewController2.h"

#import "ListItem.h"
#import "ListItemProvider.h"

#import "PublicWeiboViewController.h"

@implementation ListModule

- (void)configure{
    [self bindClass:[ListViewController class] toProtocol:@protocol(ListViewControllerProtocol)];
    [self bindProvider:[[ListItemProvider alloc] init] toClass:[ListItem class]];
    [self bindClass:[PublicWeiboViewController class] toProtocol:@protocol(PublicWeiboViewControllerProtocol)];
    [self bindClass:[ListViewController2 class] toProtocol:@protocol(ListViewController2Protocol)];

}


@end
