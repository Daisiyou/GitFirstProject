//
//  SABaseCollectionViewController.m
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "BaseCollectionViewController.h"

@interface BaseCollectionViewController ()

@end

@implementation BaseCollectionViewController

-(id)init
{
    self = [super init];
    
    if (self) {
        self.type = EBaseCollectionViewController;
    }
    
    return self;
}

//- (UICollectionViewFlowLayout *) flowLayout{
//    return 0;
//}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self initCollectionView];
}

-(void)initCollectionView{
    self.layout = [[UICollectionViewFlowLayout alloc]init];
    self.layout.minimumLineSpacing = 50;
    self.layout.minimumInteritemSpacing = 100;
    self.layout.itemSize = CGSizeMake(50, 50);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, MS_NAVBAR_HEIGHT_WITH_STATUS_BAR, MS_SCREEN_WIDTH, self.view.height - MS_NAVBAR_HEIGHT_WITH_STATUS_BAR - MS_TABBAR_HEIGHT) collectionViewLayout:self.layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate =self;
    [self.collectionView setBackgroundColor:MS_DEFAULT_BACKGROUND_COLOR];
    [self.collectionView setUserInteractionEnabled:YES];
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.collectionView setDelegate:self]; //代理－视图
    [self.collectionView setDataSource:self]; //代理－数据
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)stopRefreshLoadMore
{
    [self.collectionView.header endRefreshing];
    [self.collectionView.footer endRefreshing];
}


#pragma mark - collectionView delegate
////设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 0;
}
//
////每个分区上的元素个数
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return 9;
//}
//
////设置元素内容
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
//    
//    [cell setBackgroundColor:[UIColor redColor]];
//    
//    return cell;
//}


//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    UIEdgeInsets top = {50,0,0,0};
//    return top;
//}
//
////设置顶部的大小
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    CGSize size={0,0};
//    return size;
//}
//设置元素大小
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(50 , 50);
//}
//
////点击元素触发事件
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//}

@end
