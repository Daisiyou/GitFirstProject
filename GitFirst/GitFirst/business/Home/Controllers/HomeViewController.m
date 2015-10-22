//
//  HomeViewController.m
//  GitFirst
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "HomeViewController.h"
#import "NextViewController.h"
#import "DOPDropDownMenu.h"
#import "SDCycleScrollView.h"


@interface HomeViewController ()<DOPDropDownMenuDataSource,DOPDropDownMenuDelegate,SDCycleScrollViewDelegate>

@property (nonatomic, strong) NSArray *classifys;
@property (nonatomic, strong) NSArray *cates;
@property (nonatomic, strong) NSArray *movices;
@property (nonatomic, strong) NSArray *hostels;
@property (nonatomic, strong) NSArray *areas;

@property (nonatomic, strong) NSArray *sorts;
@property (nonatomic, weak) DOPDropDownMenu *menu;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton  * button = [[UIButton alloc]initWithFrame:CGRectMake(20, 64, 100, 50)];
    [button setTitle:@"button" forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(nextVC) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    self.fd_prefersNavigationBarHidden = YES;
    // Do any additional setup after loading the view.
    
    // 数据
    self.classifys = @[@"美食",@"今日新单",@"电影",@"酒店"];
    self.cates = @[@"自助餐",@"快餐",@"火锅",@"日韩料理",@"西餐",@"烧烤小吃"];
    self.movices = @[@"内地剧",@"港台剧",@"英美剧"];
    self.hostels = @[@"经济酒店",@"商务酒店",@"连锁酒店",@"度假酒店",@"公寓酒店"];
    self.areas = @[@"全城",@"芙蓉区",@"雨花区",@"天心区",@"开福区",@"岳麓区"];
    self.sorts = @[@"默认排序",@"离我最近",@"好评优先",@"人气优先",@"最新发布"];
    
    // 添加下拉菜单
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 20) andHeight:44];
    menu.delegate = self;
    menu.dataSource = self;
    [self.view addSubview:menu];
    _menu = menu;
    [menu selectDefalutIndexPath];
    
    
    // 情景一：采用本地图片实现
    NSArray *images = @[[UIImage imageNamed:@"h1.jpg"],
                        [UIImage imageNamed:@"h2.jpg"],
                        [UIImage imageNamed:@"h3.jpg"],
                        [UIImage imageNamed:@"h4.jpg"]
                        ];
    
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    // 情景三：图片配文字
    NSArray *titles = @[@"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com",
                        @"感谢您的支持"
                        ];
    
    
    
    
    CGFloat w = self.view.bounds.size.width;
    
    // 本地加载 --- 创建不带标题的图片轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, w, 180) imagesGroup:images];
    
    cycleScrollView.infiniteLoop = YES;
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [self.view addSubview:cycleScrollView];
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    //cycleScrollView.autoScrollTimeInterval = 4.0;
    
    //网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 320, w, 180) imageURLStringsGroup:nil]; // 模拟网络延时情景
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.delegate = self;
    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.dotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
    cycleScrollView2.placeholderImage = [UIImage imageNamed:@"placeholder"];
    [self.view addSubview:cycleScrollView2];
    
    //             --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
    
    
    // 清除缓存
    //    [cycleScrollView2 clearCache];

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

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", index);
}


#pragma mark - DOPDropDownMenuDataSource,DOPDropDownMenuDelegate

- (void)menuReloadData
{
    self.classifys = @[@"美食",@"今日新单",@"电影"];
    [_menu reloadData];
}

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 3;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.classifys.count;
    }else if (column == 1){
        return self.areas.count;
    }else {
        return self.sorts.count;
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        return self.classifys[indexPath.row];
    } else if (indexPath.column == 1){
        return self.areas[indexPath.row];
    } else {
        return self.sorts[indexPath.row];
    }
}

// new datasource

- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0 || indexPath.column == 1) {
        return [NSString stringWithFormat:@"ic_filter_category_%ld",indexPath.row];
    }
    return nil;
}

- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0 && indexPath.item >= 0) {
        return [NSString stringWithFormat:@"ic_filter_category_%ld",indexPath.item];
    }
    return nil;
}

// new datasource

- (NSString *)menu:(DOPDropDownMenu *)menu detailTextForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column < 2) {
        return [@(arc4random()%1000) stringValue];
    }
    return nil;
}

- (NSString *)menu:(DOPDropDownMenu *)menu detailTextForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    return [@(arc4random()%1000) stringValue];
}

//- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column
//{
//    if (column == 0) {
//        if (row == 0) {
//           return self.cates.count;
//        } else if (row == 2){
//            return self.movices.count;
//        } else if (row == 3){
//            return self.hostels.count;
//        }
//    }
//    return 0;
//}

//- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
//{
//    if (indexPath.column == 0) {
//        if (indexPath.row == 0) {
//            return self.cates[indexPath.item];
//        } else if (indexPath.row == 2){
//            return self.movices[indexPath.item];
//        } else if (indexPath.row == 3){
//            return self.hostels[indexPath.item];
//        }
//    }
//    return nil;
//}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
    NSLog(@"%@", [menu titleForRowAtIndexPath:indexPath]);
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
