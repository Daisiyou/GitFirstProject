//
//  UIButton+Factory.m
//  Gather
//
//  Created by huangyong on 14-10-5.
//  Copyright (c) 2014年 huangyong. All rights reserved.
//

#import "UIButton+Factory.h"

@implementation UIButton (Factory)

-(void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    
    self.clipsToBounds = YES;
    UIGraphicsBeginImageContext(CGSizeMake(2, 2));
    [backgroundColor set];
    UIRectFill(CGRectMake(0, 0, 2, 2));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setBackgroundImage:[image stretchableImageWithLeftCapWidth:1 topCapHeight:1] forState:state];
}

@end
