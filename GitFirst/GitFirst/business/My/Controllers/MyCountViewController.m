//
//  MyCountViewController.m
//  GitFirst
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 minshengec. All rights reserved.
//

#import "MyCountViewController.h"
#import "RegisterView.h"

@interface MyCountViewController ()

@end

@implementation MyCountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    // Do any additional setup after loading the view.
    
    RegisterView * Register = [[RegisterView alloc]initwithFrame:CGRectMake(0, 100, MS_SCREEN_WIDTH, 400) djRegisterViewType:(DJRegisterViewTypeNoNav) action:^(NSString *acc, NSString *key) {
        
        NSLog(@"%@, %@", acc, key);
    } zcAction:^{
        NSLog(@"点击了注册");
    } wjAction:^{
         NSLog(@"点击了忘记密码");
    }];
    
    [self.view addSubview:Register];
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
