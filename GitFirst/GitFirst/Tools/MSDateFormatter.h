//
//  SADateFormatter.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import <Foundation/Foundation.h>

//时间日期转换类
@interface MSDateFormatter : NSObject

+ (MSDateFormatter *)sharedFormatter;

//NSDate转换成NSString
-(NSString*)stringFromDate:(NSDate*)date stringFormat:(NSString*)format;

//NSString转换成NSDate
-(NSDate*)dateFromString:(NSString*)dateString stringFormat:(NSString*)format;

//获取今天的日期(NSDate格式）
-(NSDate*)todayDate;

//获取今天的日期（NSString格式）
-(NSString*)todayDateStringWithFormat:(NSString*)format;

//获取对应月份的英文月份字符串，传入的参数monthStr为：01、02...12
-(NSString*)getMonthInEnglish:(NSString*)monthStr;

//获取当前日期的dayStr
-(NSString*)getCurrentDayStr;

//获取当前日期的MonthStrInEnglish
-(NSString*)getCurrentMonthInEnglish;

//获取指定日期的前一天: dataeStr的格式必须为：yyyy-MM-dd
-(NSString*)getPreviousDay:(NSString*)dateStr;

//时间戳转换为指定格式的时间字符串
-(NSString*)timeStrFromTimeStamp:(NSString*)timeStamp format:(NSString*)format;

@end
