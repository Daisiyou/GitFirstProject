//
//  SAAnimateTabbarView.m
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "AnimateTabbarView.h"
#import "TabBarViewController.h"
#import "SNNavigationController.h"

@interface AnimateTabbarView ()
{
    NSInteger g_selectedTag;
}

@property(nonatomic,strong) UIView *shadeView;
@property(nonatomic, strong)NSMutableArray* buttonArr; //tabBar  buttons

@end

@implementation AnimateTabbarView

-(instancetype)initWithTitleArr:(NSArray*)titleArr AndNormalImages:(NSArray*)normalImages AndSelectedImages:(NSArray*)selectedImages
{

    self = [super init];
    if (self) {
        self.buttonArr = [NSMutableArray array];
        g_selectedTag = 10000;
        self.backgroundColor = [UIColor whiteColor];
        UIButton * previousButton =nil;
        
        for (int i = 0; i < titleArr.count; i++)
        {
            UIButton* button = [UIButton new];
            [self.buttonArr addObject:button];
            button.backgroundColor = [UIColor clearColor];
            button.titleLabel.font = [UIFont systemFontOfSize:10.0f];
            [button setTitle:titleArr[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithHexString:@"#3c3c3c"] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithHexString:@"#fe640a"] forState:UIControlStateHighlighted];
            [button setTitleColor:[UIColor colorWithHexString:@"#fe640a"] forState:UIControlStateSelected];
            button.titleEdgeInsets = UIEdgeInsetsMake(32, -24.5, 0, 0);
            [button setImage:[UIImage imageNamed:normalImages[i]] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:selectedImages[i]] forState:UIControlStateSelected];
            button.imageEdgeInsets = UIEdgeInsetsMake(4, 48, 16, 40);
            [button addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            [button setTag:10000 + i];
            if (i == 0) {
                button.selected = YES;
            }
            [self addSubview:button];
            
            if (i == 0) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.top.bottom.equalTo(self);
                
                }];
            }else{
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(previousButton.mas_right);
                    make.top.bottom.equalTo(previousButton);
                    make.width.equalTo(previousButton);
                }];
            }
            
            if (i == titleArr.count -1) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(self.mas_right);
                }];
            }
            
            previousButton = button;
        }
    }
    return self;
}

-(void)callButtonAction:(UIButton *)sender{
    NSInteger value=sender.tag;
    
    SNNavigationController * navi = nil;
    TabBarViewController * tab = (TabBarViewController*)self.window.rootViewController;

    if (tab) {
        navi = tab.viewControllers[0];
    }

    [tab setSelectedIndex:value - 10000];
}

//移动tabbar
-(void)moveToTabbarIndex:(NSInteger)index{
    UIButton *selectBtn;
    selectBtn = self.buttonArr[10000+ index];
    
    [self buttonClickAction:selectBtn];
}

-(void)buttonClickAction:(id)sender{
    UIButton *btn=(UIButton *)sender;
    if(g_selectedTag==btn.tag)
        return;
    else
        g_selectedTag=btn.tag;
    
    for (UIButton* otherButton in self.buttonArr) {
        otherButton.selected = NO;
    }
    
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
