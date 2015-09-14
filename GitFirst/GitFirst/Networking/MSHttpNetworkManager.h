//
//  SANetworkManager.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/5/5.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "MSBaseNetworkManager.h"

/**
 *
 * http网络引擎
 *
 */
@interface MSHttpNetworkManager : MSBaseNetworkManager

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
- (AFHTTPRequestOperation *)getPofByConditions:(NSString*)orgCode supplierCityId:(NSString*)supplierCityId supplierCode:(NSString*)supplierCode type:(NSString*)type status:(NSString*)status poNo:(NSString*)poNo pageNo:(NSString *)pageNo pageCount:(NSString *)pageCount callback:(MSNetworkManagerCallback)callback;

@end
