//
//  HomeModule.m
//  testWeibo2
//
//  Created by lili on 14-12-29.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "HomeModule.h"
#import "HomeViewController.h"
#import "HomeProtocols.h"
#import "HomeItem.h"
#import "HomeItemProvider.h"

@implementation HomeModule

- (void)configure {
    [self bindClass:[HomeViewController class] toProtocol:@protocol(HomeViewControllerProtocol)];
    [self bindProvider:[[HomeItemProvider alloc] init] toClass: [HomeItem class]];
}

@end
