//
//  NSError+Extend.m
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "NSError+Extend.h"

const int KNoNetWorkErrorCode = -1004;
const int KInnerErrorCode = -1023;
const int KDataFormatErrorCode = -1024;
const int KNetWorkErrorCode = -1025;
const int KNoDataErrorCode = -1027;
const int KAsyncCanelErrorCode = -1029;

@implementation NSError (Extend)

+ (id)errorWithDomain:(NSString *)domain code:(NSInteger)code description:(NSString *)description
{
    return [NSError errorWithDomain:domain code:code userInfo:[NSDictionary dictionaryWithObject:description forKey:NSLocalizedDescriptionKey]];
}

@end
