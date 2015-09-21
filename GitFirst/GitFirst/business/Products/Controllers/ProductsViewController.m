//
//  ProductsViewController.m
//  GitFirst
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "ProductsViewController.h"

@interface ProductsViewController ()

@property(nonatomic, strong)NSMutableArray * arr;

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.title = @"Product";
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    [_arr addObject:@"nihao"];
    
    
    // Do any additional setup after loading the view.
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
