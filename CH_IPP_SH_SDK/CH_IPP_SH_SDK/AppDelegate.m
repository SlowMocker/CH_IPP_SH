//
//  AppDelegate.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/13.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "AppDelegate.h"

#import <CHUserCenter/CHUserCenter.h>
#import <IPP3/IPP3.h>

#import "CHLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    CHLoginViewController *loginVc = [[CHLoginViewController alloc]initWithNibName:@"CHLoginViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginVc];
    UIWindow *window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    [window makeKeyAndVisible];
    window.backgroundColor = [UIColor whiteColor];
    window.rootViewController = nav;
    
    
    // 用户云 SDK 配置
    [[CHUserCenterManager sharedInstance] startWithAppKey:@"3aca93d4" secertKey: @"9aecd01536324ebcb5267066aa656721" scenes: CHUCScenesOfficial];
    // debug log
    setLogLevel(3);
    
    
    // IPP SDK 配置
    [IPPSDKConfiger Instance].domainId = @"ipp.com";
    [IPPSDKConfiger Instance].domainToken = @"@#869139";
    [IPPSDKConfiger Instance].msgHostPort = @"http://m.cpns.changhong.com:8888/msgmain/";
    [IPPSDKConfiger Instance].cdcHost = @"device.chiq-cloud.com";
    [IPPSDKConfiger Instance].cdcPort = 8080;
    // debug log
    redirectNSLogToDocumentFolder();
    setLogLevel(IPPLogDebug);
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
