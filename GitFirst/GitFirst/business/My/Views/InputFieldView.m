//
//  MSInputFieldView.m
//  MinShengCrowdfinancing
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "InputFieldView.h"
#import "MSDispersedAlignment.h"

#define KLeftMargin 10
#define KRightMargin 10

#define KTitleRightSpace 10
#define KClearTextBtnLeftSpace 5
#define KTitleFont 15.0f
@implementation InputFieldView

-(id)initWithFrameTitleAndPlaceHoderText:(CGRect)frame title:(NSString*)title placeHoderText:(NSString*)placeTextHolderText
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.inputBgView = [ControlFactory createImageView:[UIColor whiteColor] width:self.width height:self.height];
        self.inputBgView.userInteractionEnabled = YES;
        self.titleLabel = [ControlFactory createLabel:title backgroundColor:[UIColor clearColor] font:[UIFont systemFontOfSize:KTitleFont] textColor:[UIColor colorWithHexString:@"#333333"] textAlignment:(NSTextAlignmentCenter) lineBreakMode:(NSLineBreakByWordWrapping)];
        self.placeHolder = [ControlFactory createLabel:placeTextHolderText backgroundColor:[UIColor clearColor] font:[UIFont systemFontOfSize:KTitleFont] textColor:[UIColor colorWithHexString:@"#a9a9a9"] textAlignment:(NSTextAlignmentLeft) lineBreakMode:(NSLineBreakByTruncatingTail)];
        self.textField = [self createTextField];
        self.clearTextBtn = [self createClearTextBtn];
        self.bottomLine = [ControlFactory createImageView:[UIColor colorWithHexString:@"#c8c7cc"] width:frame.size.width - KLeftMargin - KRightMargin height:1 / [UIScreen mainScreen].scale];
  
        [self addSubview:self.inputBgView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.placeHolder];
        [self addSubview:self.textField];
        [self addSubview:self.bottomLine];
        [self addSubview:self.clearTextBtn];
        
        self.inputBgView.left = 0;
        self.inputBgView.top = 0;
        
        self.titleLabel.left = KLeftMargin;
        self.titleLabel.top = (self.height - self.titleLabel.height) / 2;
        
        self.placeHolder.left = self.titleLabel.right + KTitleRightSpace*MS_SCREEN_SCALE;
        self.placeHolder.width = 240.0 / 320 * self.width;
        self.placeHolder.height = self.height / 2;
        self.placeHolder.centerY = self.titleLabel.centerY;
        
        self.textField.left = self.placeHolder.left;
        self.textField.size = self.placeHolder.size;
        self.textField.centerY = self.titleLabel.centerY;
        
        self.clearTextBtn.right = self.width - KRightMargin;
        self.clearTextBtn.centerY = self.titleLabel.centerY;
        [self.clearTextBtn setHidden:YES];
        
        self.bottomLine.left = KLeftMargin;
        self.bottomLine.bottom = self.height;
    }
    return self;
}

-(UITextField*)createTextField
{
    return [[UITextField alloc]init];
}

-(UIButton*)createClearTextBtn
{
    UIButton*button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:@"clearText"] forState:(UIControlStateNormal)];
    [button sizeToFit];
    return button;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.left = KLeftMargin;
    self.titleLabel.top = (self.height - self.titleLabel.height) / 2;
    self.placeHolder.left = self.titleLabel.right + KTitleRightSpace*MS_SCREEN_SCALE;
    self.placeHolder.width = self.width - self.titleLabel.right - KTitleRightSpace*MS_SCREEN_SCALE;
    self.textField.width = self.placeHolder.width - 30*MS_SCREEN_SCALE;
    self.textField.left = self.placeHolder.left;
    self.clearTextBtn.right = self.width - KRightMargin;
}

-(void)setPlaceHolderAndClearBtnHideStatus:(BOOL)hidden{
    [self.placeHolder setHidden:hidden];
    [self.clearTextBtn setHidden:!hidden];
}

-(void)dispersedAlignmentTitleLabelByAccordingToLabel:(UILabel*)accordingLabel{
    self.titleLabel.attributedText = [MSDispersedAlignment dispersedAlignmentLabel:self.titleLabel AccordingToLabel:accordingLabel WithFontSize:KTitleFont];
}

@end
