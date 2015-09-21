//
//  SAEmptyView.m
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "EmptyView.h"

@interface EmptyView()

@property (nonatomic,weak)UIButton* refreshBtn;   //刷新按钮
@property (nonatomic,weak)UIImageView* iconView;  //图标
@property (nonatomic,weak)UILabel* infoLabel;     //提示信息

@end

@implementation EmptyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = MS_COLOR_HEXSTRING(0xf5f5f5, 1);
        self.userInteractionEnabled = YES;
        
        // button
        UIButton *btn = [[UIButton alloc]init];
        self.refreshBtn = btn;
        [btn setTitle:@"点击刷新" forState:(UIControlStateNormal)];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 3.0f;
        btn.layer.borderColor = MS_COLOR_HEXSTRING(0x5f646e, 1).CGColor;
        btn.layer.borderWidth = 1.0;
        btn.backgroundColor = [UIColor clearColor];
        [btn setTitleColor:MS_COLOR_HEXSTRING(0x5f646e, 1) forState:(UIControlStateNormal)];
        [btn sizeToFit];
        [btn addTarget:self action:@selector(refreshBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        btn.size = CGSizeMake(224/2, 64/2);
        [btn.titleLabel setFont:[UIFont systemFontOfSize:30/2]];
        [self addSubview:btn];
        
        // label
        UILabel *label = [[UILabel alloc]init];
        self.infoLabel = label;
        [label setText:@"咦,没有查询出数据呢~"];
        [label setTextColor:MS_COLOR_HEXSTRING(0x363a3c, 1)];
        [label setTextAlignment:(NSTextAlignmentCenter)];
        [label setFont:[UIFont systemFontOfSize:36/2]];
        [label sizeToFit];
        [self addSubview:label];
        
        // 图标
        UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"teapot"]];
        self.iconView = imageView;
        imageView.contentMode = UIViewContentModeCenter;
        [imageView sizeToFit];
        [self addSubview:imageView];
    }
    
    return self;
}

// 重新刷新按钮的点击事件
- (void)refreshBtnClicked{
    [self.delegate onDismissEmptyView:self];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat contentHeight = self.iconView.height + 20 + self.infoLabel.height + 25 + self.refreshBtn.height;
    CGFloat topBottomMargin = (self.height - contentHeight) / 2;
    
    self.iconView.centerX = self.width / 2;
    self.iconView.top = topBottomMargin;
    
    self.infoLabel.top = self.iconView.bottom + 20;
    self.infoLabel.centerX = self.iconView.centerX;
    
    self.refreshBtn.top = self.infoLabel.bottom + 25;
    self.refreshBtn.centerX = self.iconView.centerX;
}

@end
