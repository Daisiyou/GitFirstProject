//
//  HomeViewController.m
//  GitFirst
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "HomeViewController.h"
#import "NextViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    
    UIButton  * button = [[UIButton alloc]initWithFrame:CGRectMake(20, 64, 100, 50)];
    [button setTitle:@"button" forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(nextVC) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    self.fd_prefersNavigationBarHidden = YES;
    // Do any additional setup after loading the view.
}

-(void)nextVC{
    NextViewController * VC = [[NextViewController alloc]init];
    [VC.navigationController.navigationBar setHidden:NO];
    
  
    [VC.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
