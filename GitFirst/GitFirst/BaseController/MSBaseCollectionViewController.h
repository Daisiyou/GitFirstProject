//
//  SABaseCollectionViewController.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "MSRefreshViewController.h"

@interface MSBaseCollectionViewController : MSRefreshViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, retain)UICollectionView* collectionView;

@end
