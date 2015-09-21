//
//  NSError+Extend.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
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

