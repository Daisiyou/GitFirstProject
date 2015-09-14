//
//  SAHttpsNetworkManager.m
//  SuperAssistant
//
//  Created by 飞光普 on 15/5/6.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "MSHttpsNetworkManager.h"

@implementation MSHttpsNetworkManager

+(instancetype)defaultManager
{
    static MSHttpsNetworkManager *manager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [MSHttpsNetworkManager manager];
    });
    
    return manager;
}

-(NSString*)defaultURLString
{
    return MS_HTTPS_SERVER_ADDRESS;
}

-(void)buildParam:(NSMutableDictionary *)params
{
    [params setValue:@"I001" forKey:@"origDomain"];
    [params setValue:@"" forKey:@"homeDomain"];
    params[@"platform"] = @"IOS";
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSString* softversion = [infoPlist objectForKey:@"CFBundleVersion"];
    params[@"version"] = softversion;
    //Other default params
    
}

-(AFHTTPRequestOperation*)GetWithPath:(NSString*) path //GET方法
                               params:(NSMutableDictionary *)params
                             callback:(MSNetworkManagerCallback)callback
{
    [super PostWithPath:path params:params callback:callback];
    
    //完善请求链接
    NSString* urlString = [[self defaultURLString] stringByAppendingString:path];
    
    return [self GET:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        callback(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callback(operation.responseObject, error);
    }];
}

-(AFHTTPRequestOperation*)PostWithPath:(NSString*) path //POST方法
                                params:(NSMutableDictionary *)params
                              callback:(MSNetworkManagerCallback)callback
{
    [super PostWithPath:path params:params callback:callback];
    
    //完善请求链接
    NSString* urlString = [[self defaultURLString] stringByAppendingString:path];
    
    return [self POST:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        callback(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callback(operation.responseObject, error);
    }];
}

/*
 *	@brief	登录 (Example)
 *
 *	@param 	userName：用户名
 *	@param 	password：密码
 *
 *	@return	AFHTTPRequestOperation
 */
- (AFHTTPRequestOperation *)login:(NSString*)userName password:(NSString*)password callback:(MSNetworkManagerCallback)callback
{
    NSMutableDictionary *params = [@{@"account": userName, @"password" : password,} mutableCopy];
    
    return [self PostWithPath:@"/auth/login"
                       params:params
                     callback:callback];
}

@end