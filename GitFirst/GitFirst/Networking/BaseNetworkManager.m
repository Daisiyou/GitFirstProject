//
//  SANetworkManager.m
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "BaseNetworkManager.h"

@implementation BaseNetworkManager

+ (instancetype)defaultManager;
{
    return nil;
}

-(NSString *)defaultURLString
{
    return nil;
}

-(void)buildParam:(NSMutableDictionary *)params
{
    return;
}

-(AFHTTPRequestOperation*)GetWithPath:(NSString*) path //GET方法
                               params:(NSMutableDictionary *)params
                             callback:(NetworkManagerCallback)callback
{
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];//设置相应内容类型
    
    //添加上默认参数
    [self buildParam:params];
    
    return nil;
}

-(AFHTTPRequestOperation*)PostWithPath:(NSString*) path //POST方法
                                params:(NSMutableDictionary *)params
                              callback:(NetworkManagerCallback)callback
{
    self.securityPolicy.allowInvalidCertificates = YES;
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];//设置相应内容类型
    
    //添加上默认参数
    [self buildParam:params];
    
    return nil;
}

@end
