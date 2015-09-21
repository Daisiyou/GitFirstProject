//
//  SAHttpsNetworkManager.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "BaseNetworkManager.h"

/**
 *
 * https网络引擎
 *
 */
@interface HttpsNetworkManager : BaseNetworkManager

/*
 *	@brief	登录 (Example)
 *
 *	@param 	userName：用户名
 *	@param 	password：密码
 *
 *	@return	AFHTTPRequestOperation
 */
- (AFHTTPRequestOperation *)login:(NSString*)userName password:(NSString*)password callback:(NetworkManagerCallback)callback;

@end
