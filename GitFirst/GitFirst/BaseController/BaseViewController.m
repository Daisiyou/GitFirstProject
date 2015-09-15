//
//  SABaseViewController.m
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController () <UIAlertViewDelegate>

@end

@implementation BaseViewController

-(id)init
{
    self = [super init];
    
    if (self) {
        self.type = EBaseViewController;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = MS_DEFAULT_BACKGROUND_COLOR;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initNavButtons];
}

- (void)dealloc
{
    [self removeNotificationAndKVO];
    
    [SVProgressHUD dismiss];
}

- (void)initNavButtons
{
    
}

- (void)registNotificationAndKVO
{
    
}

-(void)removeNotificationAndKVO
{
    
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
