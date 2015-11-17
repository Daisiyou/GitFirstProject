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

@property(nonatomic, strong)AnimateTabbarView* tabbar;

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
    self.tabbar = [[AnimateTabbarView alloc]initWithTitleArr:@[@"主页",@"产品",@"我的"] AndNormalImages:@[@"tb_account1",@"tb_search1",@"tb_service1"] AndSelectedImages:@[@"tb_account2",@"tb_search2",@"tb_service2"]];
    [self.tabBar removeAllSubviews];

    self.tabbar.frame = CGRectMake(0, 0, self.tabBar.width, self.tabBar.height);
    [self.tabBar addSubview:self.tabbar];
}

-(void)viewWillLayoutSubviews
{
    self.tabbar.frame = CGRectMake(0, 0, self.tabBar.width, self.tabBar.height);
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma 横竖屏
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

@end
