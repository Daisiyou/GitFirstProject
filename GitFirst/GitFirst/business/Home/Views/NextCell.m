//
//  NextCell.m
//  GitFirst
//
//  Created by Daisiyou on 15/10/20.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "NextCell.h"

const int messageFont = 14;

@interface NextCell()

@property(nonatomic, strong)UILabel* message;
@property(nonatomic, strong)UIButton* showMoreBtn;
@property(nonatomic, strong)UILabel* calculateMessage;


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

-(void)initUI
{
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.mas_equalTo(MS_SCREEN_WIDTH);
    }];
    
    _message = [ControlFactory createLabel:@"123" backgroundColor:[UIColor clearColor] font:[UIFont systemFontOfSize:messageFont] textColor:[UIColor blackColor] textAlignment:(NSTextAlignmentCenter) lineBreakMode:(NSLineBreakByTruncatingTail)];
    [self.contentView addSubview:_message];
    _message.numberOfLines = 3;
    [_message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@10);
        make.right.equalTo(@(-10));
        make.bottom.equalTo(@(-10));
    }];
    
//    _showMoreBtn = [UIButton new];
//    [_showMoreBtn setTitle:@"展开" forState:(UIControlStateNormal)];
//    [self.contentView addSubview:_showMoreBtn];
//    
//    [_showMoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//    }];
}

-(void)setData:(NSString*)data{
    
    _message.text = data;
//    _calculateMessage = [ControlFactory createLabel:data backgroundColor:[UIColor clearColor] font:[UIFont systemFontOfSize:messageFont] textColor:[UIColor redColor] textAlignment:(NSTextAlignmentCenter) lineBreakMode:(NSLineBreakByTruncatingTail)];
//    _calculateMessage.numberOfLines = 0;
//    _calculateMessage.width = self.contentView.width - 20;
//    _calculateMessage.height = 100;
//    _calculateMessage.left = 0;
//    _calculateMessage.top = 0;
//    [self.contentView addSubview:_calculateMessage];
//    
//    
//    
//    
//    NSLog(@"%f", _calculateMessage.height);
}

-(void)changeLines{
    
    if (_message.numberOfLines == 0) {
        _message.numberOfLines =3;
    }else{
        _message.numberOfLines = 0;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
