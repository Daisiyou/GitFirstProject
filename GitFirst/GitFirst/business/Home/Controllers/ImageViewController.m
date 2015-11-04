//
//  ImageViewController.m
//  GitFirst
//
//  Created by Daisiyou on 15/11/4.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView * imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"apple"];
    [imageView sizeToFit];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(64);
    }];
//    imageView.left = 100;
//    imageView.top = 100;
    NSLog(@"%f,%f",imageView.width, imageView.height);
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
