//
//  SABaseViewController.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseScrollView.h"

typedef enum
{
    EUnknownViewController,
    EBaseViewController,
    ERefreshViewController,
    EBaseTableViewController,
    EBaseCollectionViewController,
    EShopServeViewController,
    EStatQueryViewController,
    EMineViewController,
}MSViewControllerType;

@interface BaseViewController : UIViewController

@property (nonatomic, retain) BaseScrollView *contentView;

//ViewContoller类型
@property(nonatomic, readwrite)MSViewControllerType type;

@property(nonatomic, strong) UIButton* NaviBarLeftItem;

//子类在此函数注册通知和KVO，注意，重载后需要子类初始化Model等对象后重新调用
-(void)registNotificationAndKVO;
//子类再此函数移除通知和KVO
-(void)removeNotificationAndKVO;

//子类实现，初始化导航栏按钮
-(void)initNavButtons;

-(void)backAction;

@end
