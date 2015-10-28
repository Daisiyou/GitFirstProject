//
//  DSYRegisterView.m
//  GitFirst
//
//  Created by Daisiyou on 15/10/27.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "DSYRegisterView.h"
#import "DSYInputTextField.h"

@interface DSYRegisterView()

@property(nonatomic, strong)DSYInputTextField* loginName;
@property(nonatomic, strong)DSYInputTextField* password;

@end

@implementation DSYRegisterView

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    
    return self;
}

-(void)initUI{
    
    _loginName = [[DSYInputTextField alloc]initWithFrameTitleAndPlaceHoderText:CGRectMake(50, 400, self.width-100, 44) title:@"用户名" placeHoderText:@"请输入name"];
    _password = [[DSYInputTextField alloc]initWithFrameTitleAndPlaceHoderText:CGRectMake(50, _loginName.bottom, _loginName.width, _loginName.height) title:@"密码" placeHoderText:@"请输入密码"];
    
    [_password dispersedAlignmentTitleLabelByAccordingToLabel:[ControlFactory createLabel:@"用户名" backgroundColor:[UIColor clearColor] font:_password.titleLabel.font textColor:[UIColor blackColor] textAlignment:(NSTextAlignmentCenter) lineBreakMode:(NSLineBreakByWordWrapping)]];
    
    [self addSubview:_loginName];
    [self addSubview:_password];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self endEditing:YES];
}

#pragma mark - MSRegisterView创建，动画效果
+ (DSYRegisterView*)sharedView {
    return [[DSYRegisterView alloc]initWithFrame:[UIScreen mainScreen].bounds];
}

+ (void)show{
    [[DSYRegisterView sharedView] showView];
}

+ (void)showWithAnimation
{
    [[DSYRegisterView sharedView] showViewWithAnimation];
}

- (void)showView{
    if(!self.superview){
        NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication]windows]reverseObjectEnumerator];
        
        for (UIWindow *window in frontToBackWindows)
            if (window.windowLevel == UIWindowLevelNormal) {
                [window addSubview:self];
                break;
            }
    }
}

- (void)showViewWithAnimation{
    self.left = self.width;
    self.top = 0;
    
    if(!self.superview){
        NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication]windows]reverseObjectEnumerator];
        
        for (UIWindow *window in frontToBackWindows)
            if (window.windowLevel == UIWindowLevelNormal) {
                [window addSubview:self];
                break;
            }
    }
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         weakSelf.left = 0;
                     }
                     completion:^(BOOL finished){
                     }];
}

-(void)dismiss{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         weakSelf.left = weakSelf.width;
                     }
                     completion:^(BOOL finished){
                         [weakSelf removeFromSuperview];
                     }];
}


@end
