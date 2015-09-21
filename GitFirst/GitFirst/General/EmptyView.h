//
//  SAEmptyView.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmptyView;

@protocol EmptyViewDelegate <NSObject>

// 重新刷新
- (void)onDismissEmptyView:(EmptyView*)emptyView;

@end

//通用错误页面（空页面）
@interface EmptyView : UIView

@property (nonatomic,weak) id<EmptyViewDelegate> delegate;

@end
