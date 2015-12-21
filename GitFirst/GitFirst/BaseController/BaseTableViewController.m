//
//  SABaseTableViewController.m
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

-(id)init
{
    self = [super init];
    
    if (self) {
        self.type = EBaseTableViewController;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view);
    }];

    self.tableView.backgroundColor = MS_DEFAULT_BACKGROUND_COLOR;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.backgroundView = nil;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor=[UIColor clearColor];
   
}

//-(void)viewWillLayoutSubviews
//{
//    if (self.tableViewConstraints)
//    {
//        for (MASConstraint *masconstraint in self.tableViewConstraints)
//        {
//            [masconstraint uninstall];
//        }
//    }
//    
//    if ([UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationPortrait || [UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationPortraitUpsideDown)
//    {
//        self.tableViewConstraints = [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(64);
//            make.left.equalTo(self.view);
//            make.width.equalTo(self.view);
//            make.height.mas_equalTo(self.view.height - MS_NAVBAR_HEIGHT_WITH_STATUS_BAR - MS_TABBAR_HEIGHT);
//        }];    }
//    else
//    {
//        self.tableViewConstraints = [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(30);
//            make.left.equalTo(self.view);
//            make.width.equalTo(self.view);
//            make.height.mas_equalTo(self.view.height - 30 - MS_TABBAR_HEIGHT);
//        }];
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)stopRefreshLoadMore
{
    [self.tableView.header endRefreshing];
    [self.tableView.footer endRefreshing];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma -mark UITableView delegate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 0;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma -mark UITableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TableViewCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

@end
