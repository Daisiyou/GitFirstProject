//
//  CollectionHeaderCell.m
//  GitFirst
//
//  Created by Daisiyou on 15/11/4.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "CollectionHeaderCell.h"

@implementation CollectionHeaderCell

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    UILabel * title = [ControlFactory createLabel:@"title" backgroundColor:[UIColor clearColor] font:[UIFont systemFontOfSize:14] textColor:[UIColor blackColor] textAlignment:(NSTextAlignmentCenter) lineBreakMode:(NSLineBreakByWordWrapping)];
    [self addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.bottom.mas_equalTo(-10);
    }];
    [self setBackgroundColor:[UIColor greenColor]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
