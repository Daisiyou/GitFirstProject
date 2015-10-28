//
//  DSYInputTextField.h
//  GitFirst
//
//  Created by Daisiyou on 15/10/27.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSYInputTextField : UIView

//传入数据是左边的title 和输入框中的placeHolder
-(id)initWithFrameTitleAndPlaceHoderText:(CGRect)frame title:(NSString*)title placeHoderText:(NSString*)placeTextHolderText;

@property(nonatomic, strong)UIImageView* inputBgView;
@property(nonatomic, strong)UILabel* titleLabel;
@property(nonatomic, strong)UITextField* textField;
@property(nonatomic, strong)UILabel* placeHolder;
@property(nonatomic, strong)UIButton* clearTextBtn;
@property(nonatomic, strong)UIImageView* bottomLine;

-(void)setPlaceHolderAndClearBtnHideStatus:(BOOL)hidden;  //placeHolder 和clearBtn 的隐藏状态相反   传入表示PlaceHolder是否影藏
-(void)dispersedAlignmentTitleLabelByAccordingToLabel:(UILabel*)accordingLabel;   //对齐左边title操作

@end
