//
//  SABaseTableViewCell.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import <UIKit/UIKit.h>

//TableView base cell
@interface BaseTableViewCell : UITableViewCell

+(CGFloat)cellWidth;
+(CGFloat)cellHeight;
+(CGFloat)cellHeightWithText:(NSString*)text; //动态高度

@end
