//
//  SABaseTableViewCell.h
//  
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

//TableView base cell
@interface BaseTableViewCell : UITableViewCell

+(CGFloat)cellWidth;
+(CGFloat)cellHeight;
+(CGFloat)cellHeightWithText:(NSString*)text; //动态高度

@end
