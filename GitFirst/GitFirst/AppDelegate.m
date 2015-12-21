//
//  AppDelegate.m
//  GitFirst
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "SNNavigationController.h"

#import "HomeViewController.h"
#import "MyCountViewController.h"
#import "ProductsViewController.h"

#import "Bugtags.h"

NSString* const Appkey = @"cae3a8ae05154f3b28450794df0fe3e2";

@interface AppDelegate ()<UIAppearance>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions{
    NSLog(@"will lauched");
    
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    
//    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
//    manager.enable = YES; 
//    manager.shouldResignOnTouchOutside = NO;
//    manager.shouldToolbarUsesTextFieldTintColor = YES;
//    manager.enableAutoToolbar = YES;
//    manager.keyboardDistanceFromTextField = 10;
//    manager.enable =NO;
   // [[UIButton appearance] setBackgroundColor:[UIColor orangeColor] forState:(UIControlStateNormal)];

    //[[UIButton appearanceWhenContainedInInstancesOfClasses:@[[UINavigationBar class]]] setBackgroundColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
   // [[UIButton appearanceForTraitCollection:[UITraitCollection traitCollectionWithHorizontalSizeClass:(UIUserInterfaceSizeClassUnspecified)] whenContainedInInstancesOfClasses:@[[UINavigationBar class]]] setBackgroundColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    //[Bugtags startWithAppKey:Appkey invocationEvent:(BTGInvocationEventBubble)];
    
    
    
    [self initControllers];
    return YES;
}

-(void)initControllers{
    
    TabBarViewController* tabBarController = [[TabBarViewController alloc]init];
    
    HomeViewController* home = [[HomeViewController alloc]init];
    ProductsViewController* products = [[ProductsViewController alloc]init];
    MyCountViewController* myCount = [[MyCountViewController alloc]init];

    SNNavigationController *naviHome = [[SNNavigationController alloc]initWithRootViewController: home];
    SNNavigationController *naviProducts= [[SNNavigationController alloc]initWithRootViewController: products];
    SNNavigationController *naviMycount = [[SNNavigationController alloc]initWithRootViewController: myCount];
    
    tabBarController.viewControllers = @[naviHome,naviProducts,naviMycount];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [tabBarController initTabBar];
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
