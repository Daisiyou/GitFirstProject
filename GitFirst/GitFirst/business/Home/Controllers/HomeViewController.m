//
//  HomeViewController.m
//  GitFirst
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "HomeViewController.h"
#import "SNNavigationController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    

}

-(void)initNavButtons{

    self.title = @"主页";
    SNNavigationController * navi = (SNNavigationController*)self.navigationController;
    [navi setNavBarBgWithColor:[UIColor whiteColor]];
    [self.NaviBarLeftItem.titleLabel setFont:[UIFont systemFontOfSize:10]];
    [self.NaviBarLeftItem setTitle:@"类别" forState:(UIControlStateNormal)];
    [self.NaviBarLeftItem setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [self.NaviBarLeftItem setBackgroundImage:nil forState:(UIControlStateNormal)];
}

-(void)backAction{
    NSLog(@"类别");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
