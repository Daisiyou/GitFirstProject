//
//  NSDictionary+RemoveNSNull.m
///
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
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
