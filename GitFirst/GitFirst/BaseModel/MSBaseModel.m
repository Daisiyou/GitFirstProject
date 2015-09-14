//
//  SABaseModel.m
//  SuperAssistant
//
//  Created by 飞光普 on 15/5/6.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "MSBaseModel.h"

@implementation MSBaseModel

- (void)dealloc
{
    [self cancel];
}

-(void)cancel
{
    if (self.operation != nil) {
        [self.operation cancel];
    }
}

@end
