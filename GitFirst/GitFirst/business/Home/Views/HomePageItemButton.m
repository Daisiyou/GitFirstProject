//
//  HomePageItemButton.m
//  GitFirst
//
//  Created by Daisiyou on 15/10/30.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "HomePageItemButton.h"

@interface HomePageItemButton()

@property(nonatomic, strong) UILabel* titleLabel;
@property(nonatomic, strong) UILabel* classLabel;

@end

@implementation HomePageItemButton

-(id)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    
    return self;
}

-(void)initUI
{
    _imageButton = [UIButton new];
    
    _imageButton.imageEdgeInsets = UIEdgeInsetsMake(-40, 0, 0, 0);
    [_imageButton setImage:[UIImage imageNamed:@"return"] forState:(UIControlStateNormal)];
    [self addSubview:_imageButton];
    [_imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 80));
        make.left.top.mas_equalTo(KSpaceLeft);
        make.bottom.right.mas_equalTo(- KSpaceLeft);
    }];
    
    _classLabel = [ControlFactory createLabel:@"class" backgroundColor:[UIColor clearColor] font:[UIFont systemFontOfSize:10] textColor:[UIColor blackColor] textAlignment:(NSTextAlignmentCenter) lineBreakMode:(NSLineBreakByTruncatingTail)];
    
    [self addSubview:_classLabel];
    
    [_classLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(_imageButton);;
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
