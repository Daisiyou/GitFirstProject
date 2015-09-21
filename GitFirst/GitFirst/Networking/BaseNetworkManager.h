//
//  SANetworkManager.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

typedef void (^NetworkManagerCallback)(id resp, NSError *error);

/**
 *
 * 网络引擎基类
 *
 */
@interface BaseNetworkManager : AFHTTPRequestOperationManager

+ (instancetype)defaultManager;

-(NSString * const)defaultURLString; //默认的服务器地址

-(void)buildParam:(NSMutableDictionary *)params;//需要自定义默认参数请复写此方法

-(AFHTTPRequestOperation*)GetWithPath:(NSString*) path //GET方法
                               params:(NSMutableDictionary *)params
                             callback:(NetworkManagerCallback)callback;

-(AFHTTPRequestOperation*)PostWithPath:(NSString*) path //POST方法
                                params:(NSMutableDictionary *)params
                              callback:(NetworkManagerCallback)callback;

@end
