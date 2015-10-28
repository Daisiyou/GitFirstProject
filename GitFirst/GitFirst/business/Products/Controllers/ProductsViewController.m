//
//  ProductsViewController.m
//  GitFirst
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "ProductsViewController.h"
#import "SNNavigationController.h"
#import "CycleScrollCell.h"

#define KNaviHeight self.navigationController.navigationBar.height

@interface ProductsViewController ()<UIScrollViewDelegate>

@property(nonatomic, weak)SNNavigationController * navi;

@end

@interface ProductsViewController()

{
    UIButton *leftBtn;
    UIButton *rightBtn;
    
}

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi = (SNNavigationController*)self.parentViewController;
    [self.navi setNavBarBgWithImage:[self imageWithColor:[UIColor orangeColor]] WithAlpha:0];
    self.title = @"Product";
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.tableView.top = 0;
    self.tableView.height = self.tableView.height + MS_NAVBAR_HEIGHT_WITH_STATUS_BAR;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    leftBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [leftBtn setTitle:@"left" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [rightBtn setTitle:@"right" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf refresh];
    }];
    
    // Do any additional setup after loading the view.
}

-(void)refresh{
    [self.tableView.header endRefreshing];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)leftBtnAction
{
    NSLog(@"leftClick");
}


-(void)rightBtnAction
{
    NSLog(@"rightClick");
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else {
        return 20;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        CycleScrollCell * cell = [CycleScrollCell new];
        return cell;
        
    }else{
        UITableViewCell* cell = [UITableViewCell new];
        cell.textLabel.text = @"nihao";
        return cell;
    }
    
    return 0;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
  
    self.navi.navigationBar.hidden = NO;
    
   // NSLog(@"%f",scrollView.contentOffset.y);
    
    CGFloat yOffset  = scrollView.contentOffset.y;
    
    if (yOffset < -KNaviHeight) {
        
    }
    
    if (yOffset <0) {
        self.navi.navigationBar.hidden = YES;
    }
    
    NSLog(@"%f",KNaviHeight);
    
    CGFloat alpha = (yOffset)/KNaviHeight;
    if (alpha > 0.8) {
        alpha = 0.8;
    }
    
    NSLog(@"%f", alpha);
    [self.navi setNavBarBgWithImage:[self imageWithColor:[UIColor orangeColor]] WithAlpha:alpha];
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
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
