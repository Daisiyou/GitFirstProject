//
//  SABaseCollectionViewController.m
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "MSBaseCollectionViewController.h"


@interface MSBaseCollectionViewController ()

@end

@implementation MSBaseCollectionViewController

-(id)init
{
    self = [super init];
    
    if (self) {
        self.type = EBaseCollectionViewController;
    }
    
    return self;
}

- (UICollectionViewFlowLayout *) flowLayout{
    return 0;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewLayout* layout = [[UICollectionViewLayout alloc]init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, MS_NAVBAR_HEIGHT_WITH_STATUS_BAR, MS_SCREEN_WIDTH, self.view.height - MS_NAVBAR_HEIGHT_WITH_STATUS_BAR - MS_TABBAR_HEIGHT) collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate =self;
    
    //注册cell，
    //    [self.collectionView registerClass:[cellClass class] forCellWithReuseIdentifier:@"collectionViewCell"];
    //
    //    [self.collectionView registerClass:[headerClass class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionViewHeader"];
    //    [self.collectionView registerClass:[footerClass class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"collectionViewFooter"];
    
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
//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

//设置元素的的大小框
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets top = {0,0,0,0};
    return top;
}

//设置顶部的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={0,0};
    return size;
}
//设置元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(0, 0);
}

//点击元素触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
