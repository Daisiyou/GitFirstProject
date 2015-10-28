//
//  BaseScrollView.h
//  MSDS
//
//  Created by zhangbin on 13-9-24.
//  Copyright (c) 2013年 民生电商. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseScrollView : UIScrollView

//添加的子视图是否自动计算高度
@property (nonatomic)BOOL isValueHeight;

//子视图位置变化时调整contentSize。
- (void)contentSizeToFit;

@end
