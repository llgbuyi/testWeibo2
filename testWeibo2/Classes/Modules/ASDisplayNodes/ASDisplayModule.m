//
//  ASDisplayModule.m
//  testWeibo2
//
//  Created by lili on 15-1-8.
//  Copyright (c) 2015年 com.duowan.zpc. All rights reserved.
//

#import "ASDisplayModule.h"
#import "ASDisplayViewController.h"
#import "ASDisplayProtocols.h"

@implementation ASDisplayModule

- (void)configure {
    [self bindClass:[ASDisplayViewController class] toProtocol:@protocol(ASDisplayViewControllerProtocol)];
    
}

@end
