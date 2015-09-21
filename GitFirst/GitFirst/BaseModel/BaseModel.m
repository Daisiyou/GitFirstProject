//
//  SABaseModel.m
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

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
