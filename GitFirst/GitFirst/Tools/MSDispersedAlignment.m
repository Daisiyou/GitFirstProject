//
//  MSDispersedAlignment.m
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "MSDispersedAlignment.h"
#import <CoreText/CoreText.h> //属性字符串用

@implementation MSDispersedAlignment

+(NSMutableAttributedString*)dispersedAlignmentLabel:(UILabel*)label AccordingToLabel:(UILabel*)accordingLabel WithFontSize:(CGFloat)fontSize;
{
    NSMutableAttributedString *attributedString =[[NSMutableAttributedString alloc]initWithString:label.text];
    long number = (accordingLabel.width - label.text.length * fontSize)/(label.text.length - 1);
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberLongType,&number);
    [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge_transfer id)num range:NSMakeRange(0, [label.text length])];
    label.width = accordingLabel.width;
    return attributedString;
}

@end
