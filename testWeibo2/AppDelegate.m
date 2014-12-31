//
//  AppDelegate.m
//  testWeibo2
//
//  Created by lili on 14-12-26.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

#import "HomeModule.h"
#import "ListModule.h"
#import "AccountModule.h"

#import "CommonNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    JSObjectionInjector *injector = [JSObjection createInjectorWithModules:
                                     [[HomeModule alloc] init],
                                     [[ListModule alloc] init],
                                     [[AccountModule alloc] init],
                                     nil];
    [JSObjection setDefaultInjector:injector];
    
    UIViewController *homeViewController = [[JSObjection defaultInjector] getObject:@protocol(HomeViewControllerProtocol)];
    CommonNavigationController *homeNavViewController = [[CommonNavigationController alloc] initWithRootViewController:homeViewController];

    [self.window setRootViewController:homeNavViewController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
 
}

- (void)applicationWillTerminate:(UIApplication *)application {
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    id<AccountManagerProtocol> accountManager = [[JSObjection defaultInjector] getObject:@protocol(AccountManagerProtocol)];
    [accountManager handleOpenUrl:url];
    return YES;
}

@end