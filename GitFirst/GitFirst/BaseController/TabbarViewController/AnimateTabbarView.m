//
//  SAAnimateTabbarView.m
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "AnimateTabbarView.h"

enum barsize{
    tabitem_width=80,
    tabitem_hight=MS_TABBAR_HEIGHT,
    tab_hight=MS_TABBAR_HEIGHT,
    tab_width=320,
    other_offtop=0,
    
    img_hight=30,
    img_width=30,
    img_x=45,
    img_y=8
    
};

#define KTabItemNumber 3

@interface AnimateTabbarView ()
{
    NSInteger g_selectedTag;
}

@property(nonatomic,strong) UIButton *firstBtn;
@property(nonatomic,strong) UIButton *secondBtn;
@property(nonatomic,strong) UIButton *thirdBtn;

@property(nonatomic,strong) UIView *shadeView;

@end

@implementation AnimateTabbarView

- (id)initWithFrame:(CGRect)frame
{
    g_selectedTag = 10001;
    
    CGRect frame1=CGRectMake(frame.origin.x, frame.size.height-tab_hight, MS_SCREEN_WIDTH, tab_hight);
    
    self = [super initWithFrame:frame1];
    
    if (self)
    {
        [self setBackgroundColor:[UIColor colorWithHexString:@"#f8f8f8"]];
        
        float tabItemWidth = MS_SCREEN_WIDTH / KTabItemNumber;
        
        _shadeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tabItemWidth, tab_hight)];
        [_shadeView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_shadeView];
        
        _firstBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, tabItemWidth, tab_hight)];
        _firstBtn.backgroundColor = [UIColor clearColor];
        _firstBtn.titleLabel.font = [UIFont systemFontOfSize:10.0f];
        [_firstBtn setTitle:@"统计查询" forState:UIControlStateNormal];
        [_firstBtn setTitleColor:[UIColor colorWithHexString:@"#3c3c3c"] forState:UIControlStateNormal];
        [_firstBtn setTitleColor:[UIColor colorWithHexString:@"#fe640a"] forState:UIControlStateHighlighted];
        [_firstBtn setTitleColor:[UIColor colorWithHexString:@"#fe640a"] forState:UIControlStateSelected];
        _firstBtn.titleEdgeInsets = UIEdgeInsetsMake(32, -24.5, 0, 0);
        [_firstBtn setImage:[UIImage imageNamed:@"tb_search1"] forState:UIControlStateNormal];
        [_firstBtn setImage:[UIImage imageNamed:@"tb_search2"] forState:UIControlStateSelected];
        _firstBtn.imageEdgeInsets = UIEdgeInsetsMake(4, (tabItemWidth-26.5)/2, 16, (tabItemWidth-26.5)/2);
        [_firstBtn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [_firstBtn setTag:10001];
        _firstBtn.selected = YES;
        [self addSubview:_firstBtn];
        
        _secondBtn = [[UIButton alloc] initWithFrame:CGRectMake(tabItemWidth, 0, tabItemWidth, tab_hight)];
        _secondBtn.backgroundColor = [UIColor clearColor];
        _secondBtn.titleLabel.font = [UIFont systemFontOfSize:10.0f];
        [_secondBtn setTitle:@"门店服务" forState:UIControlStateNormal];
        [_secondBtn setTitleColor:[UIColor colorWithHexString:@"#3c3c3c"] forState:UIControlStateNormal];
        [_secondBtn setTitleColor:[UIColor colorWithHexString:@"#fe640a"] forState:UIControlStateHighlighted];
        [_secondBtn setTitleColor:[UIColor colorWithHexString:@"#fe640a"] forState:UIControlStateSelected];
        _secondBtn.titleEdgeInsets = UIEdgeInsetsMake(32, -24.5, 0, 0);
        [_secondBtn setImage:[UIImage imageNamed:@"tb_service1"] forState:UIControlStateNormal];
        [_secondBtn setImage:[UIImage imageNamed:@"tb_service2"] forState:UIControlStateSelected];
        _secondBtn.imageEdgeInsets = UIEdgeInsetsMake(4, (tabItemWidth-26)/2, 16, (tabItemWidth-26)/2);
        [_secondBtn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [_secondBtn setTag:10002];
        [self addSubview:_secondBtn];
        
        _thirdBtn = [[UIButton alloc] initWithFrame:CGRectMake(tabItemWidth*2, 0, tabItemWidth, tab_hight)];
        _thirdBtn.backgroundColor = [UIColor clearColor];
        _thirdBtn.titleLabel.font = [UIFont systemFontOfSize:10.0f];
        [_thirdBtn setTitle:@"我的" forState:UIControlStateNormal];
        [_thirdBtn setTitleColor:[UIColor colorWithHexString:@"#3c3c3c"] forState:UIControlStateNormal];
        [_thirdBtn setTitleColor:[UIColor colorWithHexString:@"#fe640a"] forState:UIControlStateHighlighted];
        [_thirdBtn setTitleColor:[UIColor colorWithHexString:@"#fe640a"] forState:UIControlStateSelected];
        _thirdBtn.titleEdgeInsets = UIEdgeInsetsMake(32, -24.5, 0, 0);
        [_thirdBtn setImage:[UIImage imageNamed:@"tb_account1"]forState:UIControlStateNormal];
        [_thirdBtn setImage:[UIImage imageNamed:@"tb_account2"] forState:UIControlStateSelected];
        _thirdBtn.imageEdgeInsets = UIEdgeInsetsMake(4, (tabItemWidth-25.5)/2, 16, (tabItemWidth-25.5)/2);
        [_thirdBtn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [_thirdBtn setTag:10003];
        [self addSubview:_thirdBtn];
    }
    return self;
}

-(void)callButtonAction:(UIButton *)sender{
    NSInteger value=sender.tag;
    UITabBarController *tabBarCV = (UITabBarController *)self.window.rootViewController;
    if (value==10001) {
        [tabBarCV setSelectedIndex:0];
    }else if (value==10002) {
        [tabBarCV setSelectedIndex:1];
    }else if (value==10003) {
        [tabBarCV setSelectedIndex:2];
    }
}

//移动tabbar（1-3）
-(void)moveToTabbarIndex:(NSInteger)index{
    UIButton *selectBtn;
    if (index == 0) {
        selectBtn = _firstBtn;
    }
    else if (index == 1){
        selectBtn = _secondBtn;
    }
    else if (index == 2){
        selectBtn = _thirdBtn;
    }
    
    [self buttonClickAction:selectBtn];
}

-(void)buttonClickAction:(id)sender{
    UIButton *btn=(UIButton *)sender;
    if(g_selectedTag==btn.tag)
        return;
    else
        g_selectedTag=btn.tag;
    
    _firstBtn.selected = NO;
    _thirdBtn.selected = NO;
    _secondBtn.selected = NO;
    btn.selected = YES;
    
    [self moveShadeBtn:btn];
    [self imgAnimate:btn];
    [self callButtonAction:btn];
    
    return;
}


- (void)moveShadeBtn:(UIButton*)btn{
    
    [UIView animateWithDuration:0.3 animations:
     ^(void){
         _shadeView.left = btn.left;
         
     } completion:^(BOOL finished){//do other thing
     }];
    
    
}

- (void)imgAnimate:(UIButton*)btn{
    
    [btn.imageView.layer removeAllAnimations];
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.35;
    animation.delegate = self;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [btn.imageView.layer addAnimation:animation forKey:nil];
}

@end
