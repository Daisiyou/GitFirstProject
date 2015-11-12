//
//  CollectionViewController.m
//  GitFirst
//
//  Created by Daisiyou on 15/11/4.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionHeaderCell.h"

@interface CollectionViewController ()

@property(nonatomic, strong)NSMutableArray * titleArr;

@end

@implementation CollectionViewController

-(id)init{
    self = [super init];
    if (self) {
        _titleArr = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingColloctionView];
    
    // Do any additional setup after loading the view.
}

-(void)settingColloctionView{
    self.layout.minimumLineSpacing = 50;
    self.layout.minimumInteritemSpacing = (MS_SCREEN_WIDTH - 50*3) / 2;
    self.layout.itemSize = CGSizeMake(50, 50);
    
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlelongGesture:)];
    [self.collectionView addGestureRecognizer:longGesture];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
    [self.collectionView registerClass:[CollectionHeaderCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionViewHeader"];
}

- (void)handlelongGesture:(UILongPressGestureRecognizer *)longGesture {
    //判断手势状态
    switch (longGesture.state) {
        case UIGestureRecognizerStateBegan:{
            //判断手势落点位置是否在路径上
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[longGesture locationInView:self.collectionView]];
            if (indexPath == nil) {
                break;
            }
            //在路径上则开始移动该路径上的cell
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            break;
        case UIGestureRecognizerStateChanged:
            //移动过程当中随时更新cell位置
            [self.collectionView updateInteractiveMovementTargetPosition:[longGesture locationInView:self.collectionView]];
            break;
        case UIGestureRecognizerStateEnded:
            //移动结束后关闭cell移动
            [self.collectionView endInteractiveMovement];
            break;
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
//
////每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];

    [cell setBackgroundColor:[UIColor redColor]];
    
    [cell removeAllSubviews];
    UILabel * title = [ControlFactory createLabel:@"" backgroundColor:[UIColor clearColor] font:[UIFont systemFontOfSize:14] textColor:[UIColor blackColor] textAlignment:(NSTextAlignmentCenter) lineBreakMode:(NSLineBreakByWordWrapping)];
    [cell addSubview:title];
    title.text = _titleArr[indexPath.row];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(cell);
    }];

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    CollectionHeaderCell * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionViewHeader" forIndexPath:indexPath];

    return header;
    
}

////设置顶部的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={self.view.width,100};
    return size;
}

#pragma moveItem

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath{

    NSString* source = _titleArr[sourceIndexPath.row];
    [_titleArr removeObject:source];
    [_titleArr insertObject:source atIndex:destinationIndexPath.row];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"%ld", (long)[_titleArr[indexPath.row] integerValue]);
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
