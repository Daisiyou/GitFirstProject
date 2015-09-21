//
//  SFCTabBarViewController.m
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
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
