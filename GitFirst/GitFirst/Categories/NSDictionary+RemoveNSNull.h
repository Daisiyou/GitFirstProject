//
//  NSDictionary+RemoveNSNull.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/5/8.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NSDictionary_RemoveNSNull)

- (id)validValueForKey:(NSString *)key;

@end
