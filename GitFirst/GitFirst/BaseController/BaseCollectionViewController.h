//
//  SABaseCollectionViewController.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "RefreshViewController.h"

@interface BaseCollectionViewController : RefreshViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, retain)UICollectionView* collectionView;

@end
