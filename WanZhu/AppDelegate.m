//
//  AppDelegate.m
//  WanZhu
//
//  Created by 古玉彬 on 16/6/27.
//  Copyright © 2016年 ms. All rights reserved.
//

#import "AppDelegate.h"
#import "MS_HomeViewController.h"
#import "MS_WindowTool.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [MS_WindowTool chooseRootViewControllerWithWindow:self.window];
    [self checkNetWork];
    
    
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


#pragma mark - 这里进行网路判断
- (void)checkNetWork {
    
    AFNetworkReachabilityManager * manager = [AFNetworkReachabilityManager sharedManager];
    //开启检测网络
    [manager startMonitoring];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                //未知
                //发送一个有网的通知
                [[NSNotificationCenter defaultCenter] postNotificationName:isnetWorkNotificationYes object:nil];
            }
                break;
                
            case AFNetworkReachabilityStatusNotReachable: {
                //没网
                
                [[NSNotificationCenter defaultCenter] postNotificationName:isnetWorkNotificationNo object:nil];
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                //3g 4g /gprs
                [[NSNotificationCenter defaultCenter] postNotificationName:isnetWorkNotificationYes object:nil];
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                //wifi
                
                [[NSNotificationCenter defaultCenter] postNotificationName:isnetWorkNotificationYes object:nil];
                
            }
                break;
            default:
                break;
        }
    }];
    
}

@end
