//
//  CycleScrollCell.m
//  GitFirst
//
//  Created by Daisiyou on 15/10/28.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "CycleScrollCell.h"
#import "SDCycleScrollView.h"

@interface CycleScrollCell()<SDCycleScrollViewDelegate>

@end

@implementation CycleScrollCell

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
        make.height.equalTo(@200);
        make.width.mas_equalTo(self);
    }];
    
    NSArray *images = @[[UIImage imageNamed:@"h1.jpg"],
                        [UIImage imageNamed:@"h2.jpg"],
                        [UIImage imageNamed:@"h3.jpg"],
                        [UIImage imageNamed:@"h4.jpg"]
                        ];

    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView new];
    [self.contentView addSubview:cycleScrollView];
    cycleScrollView.localizationImagesGroup = images;
    [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView);
        make.height.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
    }];
    
    cycleScrollView.infiniteLoop = YES;
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", index);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
