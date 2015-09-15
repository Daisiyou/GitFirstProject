//
//  SANetworkManager.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/5/5.
//  Copyright (c) 2015年 飞光普. All rights reserved.
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
