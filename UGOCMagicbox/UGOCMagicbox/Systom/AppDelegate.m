//
//  AppDelegate.m
//  UGOCMagicbox
//
//  Created by admin on 2019/6/26.
//  Copyright © 2019 UG. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Welcom.h"
#import "UIAppdelegate+Realm.h"
#import "UIApplication+Timer.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //配置DoraemonKit 测试工具
    [self configDoraemonKit];
    //配置CocoaLumberjack 日志
    [self configCocoaLumberjack];
    //全局定时器
    [[UIApplication sharedApplication] startGloableTimer];
    //配置Realm数据库
    NSString *filepath = [NSString stringWithFormat:@"%@/shares/default.realm",PATHDOCUMENT];
    [[UIApplication sharedApplication] configRealm:UGURL(filepath)];
    
    [[UIApplication sharedApplication]configTABAnimated];
    
    [self configRTRootNavigationController];
    //配置tabbar
    [self configTabBar];
    //配置网易云信
    [self configNIMSDK];
    
    //配置广告页
//    [self configDMViewController:^(UIButton * _Nullable sender) {
//        //配置欢迎页
//        [self configWelcom:^(UIButton * _Nullable sender) {
//            //配置tabbar
//            [self configTabBar];
//        }];
//    }];

    
    return YES;
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
