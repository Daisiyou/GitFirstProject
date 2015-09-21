//
//  SABaseTableViewCell.m
//  
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)cellWidth
{
    return 0.0f;
}

+(CGFloat)cellHeight
{
    return 0.0f;
}

+(CGFloat)cellHeightWithText:(NSString*)text
{
    return 0.0f;
}

@end
