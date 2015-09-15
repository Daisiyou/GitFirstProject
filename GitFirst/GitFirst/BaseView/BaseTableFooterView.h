//
//  SABaseTableFooterView.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/5/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableFooterView : UIView

+(CGFloat)cellWidth;
+(CGFloat)cellHeight;
+(CGFloat)cellHeightWithText:(NSString*)text; //动态高度

@end
