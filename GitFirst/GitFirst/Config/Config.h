//
//  SAConfig.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+Sizes.h"
#import "UIColorCategory.h"
#import "UIViewController+UIRectEdge.h"
#import "SVProgressHUD.h"
#import "NSError+Extend.h"
#import "ControlFactory.h"
#import "DateFormatter.h"
#import "UIImageView+WebCache.h"
#import "MJExtension.h"
#import "UIButton+Factory.h"
#import "MJRefresh.h"
#import "PureLayout.h"
#import "UIButton+EnlargeEdge.h"
#import "AFNetworking.h"
#import "HttpNetworkManager.h"
#import "HttpsNetworkManager.h"
#import "NSDictionary+RemoveNSNull.h"

//系统版本
#define OS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])

//手机设备
#define IS_IOS_PHONE (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)?YES:NO)

/*屏高和屏宽，不是实际物理像素，只是用于显示。*/
#define MS_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define MS_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define MS_SCREEN_HEIGHT_NOSTATUSBAR ([[UIScreen mainScreen] bounds].size.height - 20)
#define MS_TABBAR_HEIGHT 49
#define MS_NAVBAR_HEIGHT 44
#define MS_STATUSBAR_HEIGHT 20
#define MS_NAVBAR_HEIGHT_WITH_STATUS_BAR (MS_NAVBAR_HEIGHT+20)
#define MS_SCREEN_SCALE (MS_SCREEN_WIDTH/320.0)

//测试服务器地址
//#define MS_HTTP_SERVER_ADDRESS @"http://192.168.1.2:8080"
//#define MS_HTTPS_SERVER_ADDRESS @"https://192.168.1.2:8443"

//正式服务器地址
#define MS_HTTP_SERVER_ADDRESS @"http://115.182.208.46"
#define MS_HTTPS_SERVER_ADDRESS @"https://115.182.208.46"

//无效用户凭证错误码
#define KBad_Token_Error_Code @"0008"
//无效用户凭证通知
#define KBAD_TOKEN_NOTIFICATION @"Bad_Token_Notification"
//无效用户凭证登录返回消息key值
#define KBAD_TOKEN_ERROR_MESSAGE @"Bad_Token_Error_Message"

//版本标识
#define MS_APP_GUIDE_VERSION @"appGuidedVerison"

//操作系统版本是否高于ios8，用于版本判断解决兼容性问题
#define IS_IOS8_OR_HIGHER_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

//文件路径
#define BUNDLE_FILE_PATH(FILE_NAME) [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:FILE_NAME]
#define DOCUMENT_FILE_PATH(FILE_NAME) [NSString stringWithFormat:@"%@/Documents/%@", NSHomeDirectory(),FILE_NAME]
#define LIBRARY_CACHES_FILE_PATH(FILE_NAME) [NSString stringWithFormat:@"%@/Library/Caches/%@", NSHomeDirectory(),FILE_NAME]

//导航栏Title相关
#define MS_NAVBAR_TITLE_FONT_SIZE 18
#define MS_NAVBAR_TITLE_FONT_WITH_SIZE MS_BOLD_FONT_WITH_SIZE(MS_NAVBAR_TITLE_FONT_SIZE)
#define MS_NAVBAR_TITLE_COLOR MS_COLOR_HEXSTRING(0xffffff, 1)

//导航栏左边按钮相关
#define MS_NAVBAR_LEFT_BUTTON_SPACE -8
#define MS_NAVBAR_LEFT_BUTTON_TITLE_COLOR MS_COLOR_HEXSTRING(0xffffff, 1)
#define MS_NAVBAR_LEFT_BUTTON_FONT MS_FONT_WITH_SIZE(14.0f)

//导航栏右边按钮相关
#define MS_NAVBAR_RIGHT_BUTTON_SPACE -8
#define MS_NAVBAR_RIGHT_BUTTON_TITLE_COLOR MS_COLOR_HEXSTRING(0xffffff, 1)
#define MS_NAVBAR_RIGHT_BUTTON_FONT MS_FONT_WITH_SIZE(14.0f)

//根据rgba生成color
#define MS_COLOR_RGBAVALUE(r,g,b,a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]

//生成UIColor 十六进制
#define MS_COLOR_HEXSTRING(rgbValue,a) MS_COLOR_RGBAVALUE((float)((rgbValue & 0xFF0000) >> 16),(float)((rgbValue & 0xFF00) >> 8),(float)(rgbValue & 0xFF),a)

//系统字体
#define MS_FONT_WITH_SIZE(size) [UIFont systemFontOfSize:size]
#define MS_BOLD_FONT_WITH_SIZE(size) [UIFont boldSystemFontOfSize:size]

//网络操作正确响应代码
#define MS_NETWORKOP_RESPONSE_SUCCEED_CODE 0000

//背景颜色
#define MS_DEFAULT_BACKGROUND_COLOR MS_COLOR_HEXSTRING(0xf6f6f6, 1)

//整体左右默认边距
#define MS_DEFAULT_LEFT_MARGIN 15
#define MS_DEFAULT_RIGHT_MARGIN 15

//整体上下默认边距
#define MS_DEFAULT_TOP_MARGIN 15
#define MS_DEFAULT_BOTTOM_MARGIN 15

#pragma mark -Cache and Downloads
#define CACHE_ROOT_FOLDER @"com.hackemist.SDWebImageCache.default"
#define CACHE_RESOURCE_FOLDER @"resource"
#define CACHE_MULTIMEDIA_FOLDER @"multimedia"
#define CACHE_MULTIMEDIA_WEBPAGE_FOLDER @"webPage"
#define CACHE_DOWNLOAD_TMP_FOLDER @"downloadTmp"
#define CACHE_LOG_FOLDER @"log"

#define PHONE_NUMBER_REX @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$"