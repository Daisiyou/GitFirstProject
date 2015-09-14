//
//  NSDictionary+RemoveNSNull.m
//  SuperAssistant
//
//  Created by 飞光普 on 15/5/8.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "NSDictionary+RemoveNSNull.h"

@implementation NSDictionary (NSDictionary_RemoveNSNull)

- (id)validValueForKey:(NSString *)key
{
    id value = [self valueForKey:key];
    
    if ([value isKindOfClass:[NSNull class]] || value == nil) {
        value = @"";
    }
    
    return value;
}

@end
