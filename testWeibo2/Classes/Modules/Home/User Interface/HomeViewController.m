//
//  HomeViewController.m
//  testWeibo2
//
//  Created by lili on 14-12-26.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "HomeViewController.h"
#import "WeiboLogin.h"

@interface HomeViewController ()

@end


@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)handleLoginButton:(id)sender {
    id<AccountManagerProtocol> manager = [[JSObjection defaultInjector] getObject:@protocol(AccountManagerProtocol)];
    [manager loginWithAccountType:weibo];
  
}

- (IBAction)handleUserInfoButton:(id)sender {
    id<AccountManagerProtocol> manager = [[JSObjection defaultInjector] getObject:@protocol(AccountManagerProtocol)];
    
    if (manager.currentAccount) {
        [[WeiboLogin shareInstance] requestUserWithFinishBlock:^(NSArray *result, NSError *error) {
            id<listItemProtocol> user = (id<listItemProtocol>)result[0];
            NSString *title = ((id<listItemProtocol>)user).nickName;
            self.navigationItem.title = title;
            NSLog(@"result%@", user);
        }];
    }
    
}

- (IBAction)handleFriendsButton:(id)sender {
    
    UIViewController *listViewController = [[JSObjection defaultInjector] getObject:@protocol(ListViewControllerProtocol)];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:listViewController];
    [self presentViewController:navController animated:YES completion:nil];
    
}

- (IBAction)handlePublicWeiboButton:(id)sender {
    
    UIViewController *publicWeiboViewController = [[JSObjection defaultInjector] getObject:@protocol(PublicWeiboViewControllerProtocol)];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:publicWeiboViewController];
    [self presentViewController:navController animated:YES completion:nil];

}


- (IBAction)handleTestASTableView:(id)sender {
    
    UIViewController *listViewController2 = [[JSObjection defaultInjector] getObject:@protocol(ListViewController2Protocol)];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:listViewController2];
    [self presentViewController:navController animated:YES completion:nil];
}

@end
