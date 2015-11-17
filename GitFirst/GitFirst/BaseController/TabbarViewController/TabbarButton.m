//
//  TabbarButton.m
//  GitFirst
//
//  Created by Daisiyou on 15/11/17.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "TabbarButton.h"

@implementation TabbarButton

-(instancetype)init{

    self = [super init];
    if (self) {
        
    }
    
    return self;

}

-(void)layoutSubviews
{
    [super layoutSubviews];

    self.imageEdgeInsets = UIEdgeInsetsMake(-10, 20, 0, 0);
    self.titleEdgeInsets = UIEdgeInsetsMake(30, -27, 0, 0);

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
