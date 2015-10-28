//
//  BaseScrollView.m
//  MSDS
//
//  Created by zhangbin on 13-9-24.
//  Copyright (c) 2013年 民生电商. All rights reserved.
//

#import "BaseScrollView.h"
#import "MJRefreshFooter.h"

@implementation BaseScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)contentSizeToFit{
    CGRect contentRect = CGRectZero;
    for ( id subview in self.subviews ) {
        if (![[subview class] isSubclassOfClass:[MJRefreshFooter class]]) {
            UIView *subView = subview;
            contentRect = CGRectUnion(contentRect, subView.frame);
        }
    }
    self.contentSize = CGSizeMake(self.frame.size.width, contentRect.size.height + contentRect.origin.y);
}


- (void)willRemoveSubview:(UIView *)subview{
    if (!_isValueHeight) {
        [self contentSizeToFit];
    }
}

- (void)didAddSubview:(UIView *)subview{
    if (!_isValueHeight) {
        [self contentSizeToFit];
    }
}

@end
