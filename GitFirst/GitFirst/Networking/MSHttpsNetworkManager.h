//
//  SAHttpsNetworkManager.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/5/6.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "MSBaseNetworkManager.h"

/**
 *
 * https网络引擎
 *
 */
@interface MSHttpsNetworkManager : MSBaseNetworkManager

/*
 *	@brief	登录 (Example)
 *
 *	@param 	userName：用户名
 *	@param 	password：密码
 *
 *	@return	AFHTTPRequestOperation
 */
- (AFHTTPRequestOperation *)login:(NSString*)userName password:(NSString*)password callback:(MSNetworkManagerCallback)callback;

@end
