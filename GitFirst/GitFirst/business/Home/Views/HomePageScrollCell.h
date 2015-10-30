//
//  HomePageScrollCell.h
//  GitFirst
//
//  Created by Daisiyou on 15/10/30.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "BaseTableViewCell.h"

@class HomePageScrollCell;

@protocol HomePageScrollCellDelegate <NSObject>

-(void)beClickedAtSection:(NSInteger)section andRow:(NSInteger) row;

@end

@interface HomePageScrollCell : BaseTableViewCell

@property(nonatomic, weak) id<HomePageScrollCellDelegate> delegate;

@end
