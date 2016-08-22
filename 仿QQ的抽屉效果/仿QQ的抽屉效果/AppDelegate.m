//
//  AppDelegate.m
//  仿QQ的抽屉效果
//
//  Created by ww on 16/5/30.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "AppDelegate.h"
#import "XYDrawerViewController.h"
#import "XYLeftViewController.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    MainViewController *tabBarVc = [[MainViewController alloc] init];
    
    XYLeftViewController *leftVc = [[XYLeftViewController alloc] init];
    
    XYDrawerViewController *drawerVc = [XYDrawerViewController drawerVcWithMain:tabBarVc leftVc:leftVc leftWidth:300];
    
    self.window.rootViewController = drawerVc;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
