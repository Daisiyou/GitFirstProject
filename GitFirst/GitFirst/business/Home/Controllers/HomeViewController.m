//
//  HomeViewController.m
//  GitFirst
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "HomeViewController.h"
#import "SNNavigationController.h"
#import "HomePageScrollCell.h"
#import "CycleScrollCell.h"

@interface HomeViewController ()<HomePageScrollCellDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    [self.tableView registerClass:[HomePageScrollCell class] forCellReuseIdentifier:@"cell"];

}

-(void)initNavButtons
{

    self.title = @"主页";
    SNNavigationController * navi = (SNNavigationController*)self.navigationController;
    [navi setNavBarBgWithColor:[UIColor whiteColor]];
    UIButton * button = [UIButton new];
    button.size = CGSizeMake(40, 70);
    [button setTitle:@"类别" forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(backAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

}

-(void)backAction
{
    NSLog(@"类别");
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        return 5;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CycleScrollCell * cell = [[CycleScrollCell alloc]init];
        return cell;
    }
    
    HomePageScrollCell * cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.tag = indexPath.row;
    cell.delegate = self;
    
    return cell;
}

-(void)beClickedAtSection:(NSInteger)section andRow:(NSInteger)row{

    NSLog(@"%d, %d", section, row);
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
