//
//  SAAnimateTabbarView.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AnimateTabbarView : UIView

//移动tabbar（1-3）
-(void)moveToTabbarIndex:(NSInteger)index;

-(instancetype)initWithTitleArr:(NSArray*)titleArr AndNormalImages:(NSArray*)normalImages AndSelectedImages:(NSArray*)selectedImages;

@end
