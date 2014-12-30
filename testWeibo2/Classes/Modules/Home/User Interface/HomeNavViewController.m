//
//  HomeNavViewController.m
//  testWeibo2
//
//  Created by lili on 14-12-30.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "HomeNavViewController.h"

@interface HomeNavViewController ()

@end

@implementation HomeNavViewController


- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    UIViewController *homeViewController = [[JSObjection defaultInjector] getObject:@protocol(HomeNavViewControllerProtocol)];
    return [super initWithRootViewController:homeViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
