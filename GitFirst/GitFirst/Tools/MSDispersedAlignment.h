//
//  MSDispersedAlignment.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSDispersedAlignment : NSObject
/*
 *分散对其参数
 *label             要进行对其的label
 *accordingLabel    比照对其的label
 *fontSize          要对其label的字体size
 */

+(NSMutableAttributedString*)dispersedAlignmentLabel:(UILabel*)label AccordingToLabel:(UILabel*)accordingLabel WithFontSize:(CGFloat)fontSize;

@end
