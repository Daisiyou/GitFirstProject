//
//  SANetworkManager.m
//  SuperAssistant
//
//  Created by 飞光普 on 15/5/5.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "HttpNetworkManager.h"

@implementation HttpNetworkManager

+(instancetype)defaultManager
{
    static HttpNetworkManager *manager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [HttpNetworkManager manager];
    });
    
    return manager;
}

-(NSString*)defaultURLString
{
    return @"";
}

-(AFHTTPRequestOperation*)GetWithPath:(NSString*) path //GET方法
                               params:(NSMutableDictionary *)params
                             callback:(NetworkManagerCallback)callback
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
                              callback:(NetworkManagerCallback)callback
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

/*
 *	@brief	采购单查询 (Example)
 *
 *	@param 	orgCode：组织代码
 *	@param 	supplierCityId：供应商地区
 *	@param 	supplierCode：供应商CODE
 *	@param 	type：采购单类型
 *	@param 	status：采购单状态
 *	@param 	poNo：采购单编号
 *	@param 	pageNo：当前页码
 *	@param 	pageCount：每一页的条数
 *
 *	@return	AFHTTPRequestOperation
 */
- (AFHTTPRequestOperation *)getPofByConditions:(NSString*)orgCode supplierCityId:(NSString*)supplierCityId supplierCode:(NSString*)supplierCode type:(NSString*)type status:(NSString*)status poNo:(NSString*)poNo pageNo:(NSString *)pageNo pageCount:(NSString *)pageCount callback:(NetworkManagerCallback)callback
{
    NSMutableDictionary *params = [@{@"orgCode": orgCode, @"pageNo" : pageNo, @"pageCount": pageCount, @"supplierCityId" : supplierCityId, @"userId": @"", @"supplierCode": supplierCode, @"type" : type, @"status": status, @"poNo" : poNo, } mutableCopy];
    
    return [self GetWithPath:@"/v/purchase/purchaseOrderQueryApp/getPurchaseOrderList"
                      params:params
                    callback:callback];
}

@end
