//
//  SNNavigationController.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SlideNavigationController.h"

typedef NS_ENUM(NSUInteger, UI7NavBarSytle)
{
    UI7NavBarSytleLight, //0.4 alpha
    UI7NavBarSytleDark, //0.8 alpha
    UI7NavBarSytleBlack, //1.0
    UI7NavBarSytleTransparent, //0.0 alpha
    UI7NavBarSytleImage, //自定义图片
    UI7NavBarSytleColor, //自定义色值
};
//SlideNavigationController
@interface SNNavigationController : UINavigationController <UINavigationControllerDelegate>

@property (nonatomic,assign)UI7NavBarSytle navBarStyle;

- (void)setNavBarBgWithImage:(UIImage *)image;
- (void)setNavBarBgWithColor:(UIColor *)cl;
- (void)setNavBarBgWithColor:(UIColor *)cl animated:(BOOL)animated;
- (void)setNavBarStyle:(UI7NavBarSytle)style;
- (void)setNavBarStyle:(UI7NavBarSytle)style animated:(BOOL)animated;

@end
