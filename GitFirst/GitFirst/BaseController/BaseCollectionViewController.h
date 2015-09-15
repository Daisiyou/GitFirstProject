//
//  SABaseCollectionViewController.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "RefreshViewController.h"

@interface BaseCollectionViewController : RefreshViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, retain)UICollectionView* collectionView;

@end
