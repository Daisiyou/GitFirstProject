//
//  UIButton+EnlargeEdge.h
//  SmartHome
//
//  Created by FeiGuangpu on 15-4-17.
//  Copyright (c) 2015年 赵一峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface UIButton (EnlargeEdge)
- (void)setEnlargeEdge:(CGFloat) size;
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;
@end
