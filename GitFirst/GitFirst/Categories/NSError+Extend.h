//
//  NSError+Extend.h
//  MinShengEcPjTemplate
//
//  Created by 飞 光普 on 14-8-4.
//  Copyright (c) 2014年 MinShengEcPjTemplate All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Extend)

+ (id)errorWithDomain:(NSString *)domain code:(NSInteger)code description:(NSString *)description;

@end

const extern int KNoNetWorkErrorCode;
const extern int KInnerErrorCode;
const extern int KDataFormatErrorCode;
const extern int KNetWorkErrorCode;
const extern int KNoDataErrorCode;
const extern int KAsyncCanelErrorCode;

#define err(theCode, desc) [NSError errorWithDomain:NSStringFromClass([self class]) code:theCode description:desc]

