//
//  NextCell.m
//  GitFirst
//
//  Created by Daisiyou on 15/10/20.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "NextCell.h"


@interface NextCell()

@property(nonatomic, strong)UILabel* message;
@property(nonatomic, strong)UIButton* showMoreBtn;

@end

@implementation NextCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)initUI{
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.mas_equalTo(MS_SCREEN_WIDTH);
    }];
    
    _message = [ControlFactory createLabel:@"123" backgroundColor:[UIColor clearColor] font:[UIFont systemFontOfSize:14] textColor:[UIColor blackColor] textAlignment:(NSTextAlignmentCenter) lineBreakMode:(NSLineBreakByTruncatingTail)];
    [self.contentView addSubview:_message];
    _message.numberOfLines = 3;
    [_message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@10);
        make.right.equalTo(@(-10));
        make.bottom.equalTo(@(-10));
    }];
}

-(void)setData:(NSString*)data{
    
    _message.text = data;
}

-(void)changeLines{
    _message.numberOfLines = 0;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
