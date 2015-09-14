//
//  SABaseViewController.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@interface MSBaseViewController : UIViewController

//ViewContoller类型
@property(nonatomic, readwrite)MSViewControllerType type;

//子类在此函数注册通知和KVO，注意，重载后需要子类初始化Model等对象后重新调用
-(void)registNotificationAndKVO;
//子类再此函数移除通知和KVO
-(void)removeNotificationAndKVO;

//子类实现，初始化导航栏按钮
-(void)initNavButtons;

@end
