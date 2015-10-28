//
//  MyCountViewController.m
//  GitFirst
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "MyCountViewController.h"
#import "RegisterView.h"
#import "DSYRegisterView.h"

@interface MyCountViewController ()

@property(nonatomic, strong)RegisterView * Register;

@end

@implementation MyCountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    // Do any additional setup after loading the view.
    
//    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"login"] boolValue]) {
//         _Register = [[RegisterView alloc]initwithFrame:CGRectMake(0, 100, MS_SCREEN_WIDTH, 400) djRegisterViewType:(DJRegisterViewTypeNoNav) action:^(NSString *acc, NSString *key) {
//            
//            NSLog(@"%@, %@", acc, key);
//            if (acc.length > 0 && key.length > 0) {
//                [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"login"];
//                [_Register dismiss];
//            }
//            
//        } zcAction:^{
//            NSLog(@"点击了注册");
//        } wjAction:^{
//            NSLog(@"点击了忘记密码");
//        }];
//        
//        [self.view addSubview:_Register];
//        [_Register showFromRight];
//    }
    
    DSYRegisterView * login = [[DSYRegisterView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:login];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    UIImageView * image = [UIImageView new];
    
    image.layer.allowsEdgeAntialiasing = YES;
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
