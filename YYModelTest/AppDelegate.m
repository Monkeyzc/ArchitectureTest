//
//  AppDelegate.m
//  YYModelTest
//
//  Created by zhaofei on 2017/4/7.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "AppDelegate.h"
#import "YTKNetworkConfig.h"
#import "KLRUrlArgumentsFilter.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setYTKNetworkConfig];
    return YES;
}

- (void)setYTKNetworkConfig {
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    // 设置 根url, 可以根据不同的bundleId + target来区分不同的apiUrl
    config.baseUrl = @"http://localhost:3000";
    // 设置 app 的版本号✔️ 只有在添加了baseUrl的情况下才会生效  会以参数的形式拼接到 url 后面 http://hostname:port?version=1.1.0
    [config addUrlFilter:[KLRUrlArgumentsFilter filterWithArguments:@{@"version": @"1.1.0"}]];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
