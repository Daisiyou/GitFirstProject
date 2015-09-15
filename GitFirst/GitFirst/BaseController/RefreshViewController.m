//
//  SARefreshViewController.m
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "RefreshViewController.h"

@interface RefreshViewController ()//<SAErrorImageViewDelegate>

@end

@implementation RefreshViewController

-(EmptyView*)emptyView
{
    if (_emptyView == nil) {
        _emptyView = [[EmptyView alloc]initWithFrame:CGRectMake(0, 0, MS_SCREEN_WIDTH, MS_SCREEN_HEIGHT)];
        _emptyView.delegate = self;
    }
    
    return _emptyView;
}

-(NetErrorView*)netErrorView
{
    if (_netErrorView == nil) {
        _netErrorView = [[NetErrorView alloc]initWithFrame:CGRectMake(0, 0, MS_SCREEN_WIDTH, MS_SCREEN_HEIGHT)];
        _netErrorView.delegate = self;
    }
    
    return _netErrorView;
}

-(id)init
{
    self = [super init];
    
    if (self) {
        self.type = ERefreshViewController;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refresh
{
    
}

-(void)loadMore
{
    
}

-(void)stopRefreshLoadMore
{
    
}

#pragma mark - SANetErrorViewDelegate
- (void)onDismissNetErrorView:(NetErrorView *)errorView
{
    [self refresh];
}

#pragma mark - SAEmptyViewDelegate
-(void)onDismissEmptyView:(EmptyView *)emptyView
{
    [self refresh];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
