//
//  NextViewController.m
//  GitFirst
//
//  Created by Daisiyou on 15/10/20.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "NextViewController.h"
#import "NextCell.h"

@interface NextViewController ()

@property(nonatomic, strong)UIView * changeView;

@property(nonatomic, strong)NSArray* dataSources;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    
    self.title = @"New VC";
    _dataSources = @[@"The first step to creating a fancy animation was creating a UITableViewCell (called BookCell) with flexible constraints. By flexible, I mean that no constraint was absolutely required. The cell included a yellow subview subview with a collapsible height constraint — the height constraint always has a constant of 0, and it initially has a priority of 999. Within the collapsible subview, no vertical constraints are required. We set the priority of all the internal vertical constraints to 998.",@"用人单位法定节假日安排加班，应按不低于日或者小时工资基数的300％支付加班工资，休息日期间安排加班，应当安排同等时间补休，不能安排补休的，按照不低于日或者小时工资基数的200％支付加班工资。",@"如《广东省工资支付条例》第三十五 条非因劳动者原因造成用人单位停工、停产，未超过一个工资支付周期（最长三十日）的，用人单位应当按照正常工作时间支付工资。超过一个工资支付周期的，可以根据劳动者提供的劳动，按照双方新约定的标准支付工资；用人单位没有安排劳动者工作的，应当按照不低于当地最低工资标准的百分之八十支付劳动者生活费，生活费发放至企业复工、复产或者解除劳动关系。",@"来看看劳动法克林顿刷卡思考对方卡拉卡斯的楼房卡拉卡斯的疯狂拉萨的罚款 ",@"中秋节、十一假期分为两类。一类是法定节假日，即9月30日(中秋节)、10月1日、2日、3日共四天为法定节假日;另一类是休息日，即10月4日至10月7日为休息日。",@"2000(元)÷21.75(天)×200％×1(天)=183.9(元)"];
    
    [self.tableView registerClass:[NextCell class] forCellReuseIdentifier:@"cell"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 100;
//}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSources.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NextCell* cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell setData:self.dataSources[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    NextCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell changeLines];
    [self.tableView reloadData];
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
