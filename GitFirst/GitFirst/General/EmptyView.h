//
//  SAEmptyView.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/5/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
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
