//
//  SAErrorImageView.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NetErrorView;

@protocol NetErrorViewDelegate <NSObject>

// 重新刷新
- (void)onDismissNetErrorView:(NetErrorView*)errorView;

@end

//通用错误页面（网络错误页面）
@interface NetErrorView : UIView

@property (nonatomic,weak) id<NetErrorViewDelegate> delegate;

@end
