//
//  UIButton+Factory.m
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
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
