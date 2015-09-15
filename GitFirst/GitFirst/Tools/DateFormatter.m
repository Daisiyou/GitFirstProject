//
//  SADateFormatter.m
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "DateFormatter.h"

@interface DateFormatter()
{
    NSDateFormatter* dateFormatter;
}

@end

@implementation DateFormatter

+ (DateFormatter *)sharedFormatter
{
    static dispatch_once_t pred;
    static DateFormatter *manager = nil;
    
    dispatch_once(&pred, ^{ manager = [[DateFormatter alloc] init]; });
    
    return manager;
}

-(id)init
{
    self = [super init];
    
    if (self) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
    }
    
    return self;
}

-(NSString*)stringFromDate:(NSDate*)date stringFormat:(NSString*)format
{
    [dateFormatter setDateFormat:format];
    NSString* dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

-(NSDate*)dateFromString:(NSString*)dateString stringFormat:(NSString*)format
{
    [dateFormatter setDateFormat:format];
    NSDate* date = [dateFormatter dateFromString:dateString];
    return date;
}

-(NSDate*)todayDate
{
    NSDate* date = [NSDate date];
    return date;
}

-(NSString*)todayDateStringWithFormat:(NSString *)format
{
    NSDate* today = [self todayDate];
    NSString* todayString = [self stringFromDate:today stringFormat:format];
    return todayString;
}

-(NSString*)getMonthInEnglish:(NSString*)monthStr
{
    NSString* monthStrInEnglish = @"";
    
    if ([monthStr isEqualToString:@"01"])
    {
        monthStrInEnglish = @"JAN";
    }
    else if ([monthStr isEqualToString:@"02"])
    {
        monthStrInEnglish = @"FEB";
    }
    else if ([monthStr isEqualToString:@"03"])
    {
        monthStrInEnglish = @"MAR";
    }
    else if ([monthStr isEqualToString:@"04"])
    {
        monthStrInEnglish = @"APR";
    }
    else if ([monthStr isEqualToString:@"05"])
    {
        monthStrInEnglish = @"MAY";
    }
    else if ([monthStr isEqualToString:@"06"])
    {
        monthStrInEnglish = @"JUN";
    }
    else if ([monthStr isEqualToString:@"07"])
    {
        monthStrInEnglish = @"JAL";
    }
    else if ([monthStr isEqualToString:@"08"])
    {
        monthStrInEnglish = @"AUG";
    }
    else if ([monthStr isEqualToString:@"09"])
    {
        monthStrInEnglish = @"SEP";
    }
    else if ([monthStr isEqualToString:@"10"])
    {
        monthStrInEnglish = @"OCT";
    }
    else if ([monthStr isEqualToString:@"11"])
    {
        monthStrInEnglish = @"NOV";
    }
    else if ([monthStr isEqualToString:@"12"])
    {
        monthStrInEnglish = @"DEC";
    }
    
    monthStrInEnglish = [monthStrInEnglish stringByAppendingString:@"."];
    
    return monthStrInEnglish;
}

-(NSString*)getCurrentDayStr
{
    NSDate* currentDate = [self todayDate];
    NSString* dayStr = [self stringFromDate:currentDate stringFormat:@"dd"];
    
    return dayStr;
}

-(NSString*)getCurrentMonthInEnglish
{
    NSDate* currentDate = [self todayDate];
    NSString* month = [self stringFromDate:currentDate stringFormat:@"MM"];
    NSString* monthInEnglish = [self getMonthInEnglish:month];
    return monthInEnglish;
}

-(NSString*)getPreviousDay:(NSString*)dateStr
{
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    NSDate *newDate = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([date timeIntervalSinceReferenceDate] - 24*3600)];
    NSString* previousDayStr = [dateFormatter stringFromDate:newDate];
    return previousDayStr;
}

//时间戳转换为指定格式的时间字符串
-(NSString*)timeStrFromTimeStamp:(NSString*)timeStamp format:(NSString*)format
{
    NSString* formalTimeStr = timeStamp;
    if (timeStamp.length > 10) {
        formalTimeStr = [timeStamp substringWithRange:NSMakeRange(0, 10)];
    }
    NSTimeInterval time = [formalTimeStr doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return [self stringFromDate:date stringFormat:format];
}

@end
