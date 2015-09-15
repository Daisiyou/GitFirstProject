//
//  SFCTabBarViewController.m
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "TabBarViewController.h"
#import "AnimateTabbarView.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)initTabBar
{
    AnimateTabbarView * tabBar = [[AnimateTabbarView alloc]initWithFrame:self.tabBar.frame];
    [self.tabBar removeAllSubviews];
    [self.tabBar addSubview:tabBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma 横竖屏
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

@end
