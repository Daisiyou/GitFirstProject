//
//  HomePageScrollCell.m
//  GitFirst
//
//  Created by Daisiyou on 15/10/30.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "HomePageScrollCell.h"
#import "HomePageItemButton.h"

@interface HomePageScrollCell()<UIScrollViewDelegate>

@end

@implementation HomePageScrollCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

-(void)initUI{
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [self.contentView addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.contentView);
        make.height.equalTo(@100);
    }];
    HomePageItemButton * previousButton = nil;
    
    
    for (int i = 0; i < 10; i++)
    {
        HomePageItemButton * button = [HomePageItemButton new];
        [scrollView addSubview:button];
        button.imageButton.tag = i;
        [button.imageButton addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
        
        if (i == 0) {
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.bottom.equalTo(scrollView);
            }];
        }else{
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(previousButton.mas_right);
                make.top.bottom.equalTo(previousButton);
            }];
        }
        
        if (i == 9) {
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(scrollView.mas_right);
            }];
        }
        
        previousButton = button;
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSLog(@"x: %f, y: %f", scrollView.contentOffset.x, scrollView.contentOffset.y);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"endDrag");
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
   // NSLog(@"endScroll");

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
     NSLog(@"endScroll");

}




-(void)click:(id)sender{
    if ([self.delegate respondsToSelector:@selector(beClickedAtSection:andRow:)]) {
        UIButton * button = sender;
        
        [self.delegate beClickedAtSection:self.tag andRow:button.tag];
    }
}

@end
