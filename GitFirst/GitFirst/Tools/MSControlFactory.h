//
//  MSControlFactory.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import <Foundation/Foundation.h>

//控件工厂类
@interface MSControlFactory : NSObject

//根据需要传入参数创建Label
+(UILabel*)createLabel:(NSString*)text backgroundColor:(UIColor*)backgroundColor font:(UIFont*)font textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode;

//根据传入参数创建指定背景色和指定大小的imageView
+(UIImageView*)createImageView:(UIColor*)backgroundColor width:(CGFloat)width height:(CGFloat)height;

//根据传入参数创建指定背景色和指定大小的View
+(UIView*)createView:(UIColor*)backgroundColor width:(CGFloat)width height:(CGFloat)height;

@end
