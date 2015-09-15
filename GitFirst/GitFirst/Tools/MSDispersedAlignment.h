//
//  MSDispersedAlignment.h
//  MinShengCrowdfinancing
//
//  Created by Daisiyou on 15/7/9.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
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
