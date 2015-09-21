//
//  SABaseModel.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    ERefresh, //下拉刷新
    ELoadMore, //上拉加载
}MSRefreshType;

@interface BaseModel : NSObject

@property(nonatomic, readwrite)MSRefreshType refreshType;
@property(nonatomic, strong)AFHTTPRequestOperation* operation;

-(void)cancel;

//当前页
@property(nonatomic)NSInteger currentPage;
//每一页所包含的条数，在子类的init函数中初始化
@property(nonatomic)NSInteger pageCount;

@end
