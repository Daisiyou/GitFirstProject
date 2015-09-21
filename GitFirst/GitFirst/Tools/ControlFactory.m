//
//  MSControlFactory.m
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "ControlFactory.h"

@implementation ControlFactory

+(UILabel*)createLabel:(NSString*)text backgroundColor:(UIColor*)backgroundColor font:(UIFont*)font textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    UILabel* label = [[UILabel alloc]init];
    label.backgroundColor = backgroundColor;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.lineBreakMode = lineBreakMode;
    label.text = text;
    [label sizeToFit];
    
    return label;
}

+(UIImageView*)createImageView:(UIColor*)backgroundColor width:(CGFloat)width height:(CGFloat)height
{
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    imageView.backgroundColor = backgroundColor;
    
    return imageView;
}

+(UIView*)createView:(UIColor*)backgroundColor width:(CGFloat)width height:(CGFloat)height;
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    view.backgroundColor = backgroundColor;
    
    return view;
}

@end
