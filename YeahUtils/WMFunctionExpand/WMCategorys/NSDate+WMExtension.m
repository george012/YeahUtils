//
//  NSDate+WMExtension.m
//  YeahUtils
//
//  Created by WMYeah on 2016/10/11.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

#import "NSDate+WMExtension.h"

@implementation NSDate (WMExtension)

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)wm_initWithCustomDateString:(NSString *)string
{
    NSDate *cuDate = [super init];
    if (string != nil && ![string isEqualToString:@""] && (string.length == @"201310".length || string.length == @"20131012".length || string.length == @"2013101200".length || string.length == @"201310120000".length || string.length == @"20131012000000".length)) {
        
        NSString *year = [string substringWithRange:NSMakeRange(0,4)];
        NSString *month = [[string substringFromIndex:4]
                           substringWithRange:NSMakeRange(0,2)];
        NSString *day = nil;
        NSString *hours = nil;
        NSString *seconds = nil;
        NSString *miniute = nil;
        if (string.length == @"20131012".length) {
            day = [[string substringFromIndex:6]
                   substringWithRange:NSMakeRange(0,2)];
        }
        if (string.length == @"2013101200".length) {
            day = [[string substringFromIndex:6]
                   substringWithRange:NSMakeRange(0,2)];
            hours = [[string substringFromIndex:8]
                     substringWithRange:NSMakeRange(0,2)];
        }
        
        if (string.length == @"201310120000".length) {
            day = [[string substringFromIndex:6]
                   substringWithRange:NSMakeRange(0,2)];
            hours = [[string substringFromIndex:8]
                     substringWithRange:NSMakeRange(0,2)];
            miniute = [[string substringFromIndex:10]
                       substringWithRange:NSMakeRange(0,2)];
        }
        
        if (string.length == @"20131012000000".length) {
            day = [[string substringFromIndex:6]
                   substringWithRange:NSMakeRange(0,2)];
            hours = [[string substringFromIndex:8]
                     substringWithRange:NSMakeRange(0,2)];
            miniute = [[string substringFromIndex:10]
                       substringWithRange:NSMakeRange(0,2)];
            seconds = [[string substringFromIndex:12]
                       substringWithRange:NSMakeRange(0,2)];
        }
        
        cuDate.wm_year = year;
        cuDate.wm_month = month;
        cuDate.wm_day = day;
        cuDate.wm_hours = hours;
        cuDate.wm_miniute = miniute;
        cuDate.wm_seconds = seconds;
    }else{
        cuDate.wm_year = nil;
        cuDate.wm_month = nil;
        cuDate.wm_day = nil;
    }
    return cuDate;
}




- (BOOL)wm_isSameToDate:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *compsSelf = [calendar components:unitFlags fromDate:self];
    NSDateComponents *compsOther = [calendar components:unitFlags fromDate:date];
    if(compsSelf.year == compsOther.year &&
       compsSelf.month == compsOther.month &&
       compsSelf.day == compsOther.day){
        return YES;
    }
    return NO;
}

/*!
 *  获取系统时间
 */
+ (NSDateComponents *)wm_currentDateComponent
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitQuarter |NSCalendarUnitCalendar | NSCalendarUnitDay fromDate:[NSDate date]];
    return component;
}

/**
 根据NSDate类型Objects当月天数
 
 @param date 年月日(NSDate *)
 
 @return 当月天数
 */
+ (NSUInteger)wm_daysForDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange dayRange = [calendar rangeOfUnit:NSCalendarUnitDay
                                      inUnit:NSCalendarUnitMonth
                                     forDate:date];
    return dayRange.length;
}
/**
 根据年月日计算当月天数

 @param dateString 年月日(String *)

 @return 当月天数
 */
+ (NSUInteger)wm_daysForStringDate:(NSString *)dateString
{
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:[NSString stringWithFormat:@"yyyyMMdd"]];
    NSDate *date = [dateformatter dateFromString:dateString];
    return [self wm_daysForDate:date];
}
/**
 获取系统时间

 @param spacer 分隔符.

 @return 返回系统时间
 */
+ (NSString *)wm_currentDateAndTimeConvertToStringWithSpacer:(NSString *)spacer
{
    NSDateComponents *component = [self wm_currentDateComponent];
    int year = [[NSNumber numberWithInteger:[component year]] intValue];
    int month = [[NSNumber		 numberWithInteger:[component month]] intValue];
    int day = [[NSNumber numberWithInteger:[component day]] intValue];
    int hours = [[NSNumber numberWithInteger:[component hour]] intValue];
    int minute = [[NSNumber numberWithInteger:[component minute]] intValue];
    int second = [[NSNumber numberWithInteger:[component second]] intValue];
    
    NSString *dateAndTime = [NSString stringWithFormat:@"%04d%@%02d%@%02d%@%02d%@%02d%@%02d",year,spacer,month,spacer,day,spacer,hours,spacer,minute,spacer,second];
    return dateAndTime;
}

+ (instancetype)wm_currentYear_Quarter_Moth_Day_Hours_Seconds_MiniuteWithDate:(NSDate *)customDate
{
    NSInteger month = [customDate.wm_month integerValue];
    NSInteger quarter = 0;
    
    NSInteger daysForQuarter_1 = 0;
    NSInteger daysForQuarter_2 = 0;
    NSInteger daysForQuarter_3 = 0;
    NSInteger daysForQuarter_4 = 0;
    
    NSUInteger moth_1_Days = [self wm_daysForStringDate:[NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"01",@"01"]];
    NSUInteger moth_2_Days = [self wm_daysForStringDate:[NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"02",@"01"]];
    NSUInteger moth_3_Days = [self wm_daysForStringDate:[NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"03",@"01"]];
    NSUInteger moth_4_Days = [self wm_daysForStringDate:[NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"04",@"01"]];
    NSUInteger moth_5_Days = [self wm_daysForStringDate:[NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"05",@"01"]];
    NSUInteger moth_6_Days = [self wm_daysForStringDate:[NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"06",@"01"]];
    NSUInteger moth_7_Days = [self wm_daysForStringDate:[NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"07",@"01"]];
    NSUInteger moth_8_Days = [self wm_daysForStringDate:[NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"08",@"01"]];
    NSUInteger moth_9_Days = [self wm_daysForStringDate:[NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"09",@"01"]];
    NSUInteger moth_10_Days = [self wm_daysForStringDate:[NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"10",@"01"]];
    NSUInteger moth_11_Days = [self wm_daysForStringDate:[NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"11",@"01"]];
    NSUInteger moth_12_Days = [self wm_daysForStringDate:[NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"12",@"01"]];
    
    if (month == 1 || month == 2 || month == 3) {
        daysForQuarter_1 = moth_1_Days + moth_2_Days + moth_3_Days;
        customDate.wm_daysForQuarter = [NSString stringWithFormat:@"%d",[[NSNumber numberWithInteger:daysForQuarter_1] intValue]];
        customDate.wm_currentQuaterMoths = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"firstMoth",@"2",@"secondMoth",@"3",@"thirdMoth", nil];
        customDate.wm_startDayForCurrentQuarter = [NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"01",@"01"];
        customDate.wm_lastDayForCurrentQuarter = [NSString stringWithFormat:@"%@%@%d",customDate.wm_year,@"03",[[NSNumber numberWithInteger:moth_3_Days] intValue]];
        quarter = 1;
    }else if (month == 4 || month == 5 || month == 6){
        daysForQuarter_2 = moth_4_Days+moth_5_Days+moth_6_Days;
        customDate.wm_daysForQuarter = [NSString stringWithFormat:@"%d",[[NSNumber numberWithInteger:daysForQuarter_2] intValue]];
        customDate.wm_currentQuaterMoths = [NSDictionary dictionaryWithObjectsAndKeys:@"4",@"firstMoth",@"5",@"secondMoth",@"6",@"thirdMoth", nil];
        customDate.wm_startDayForCurrentQuarter = [NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"04",@"01"];
        customDate.wm_lastDayForCurrentQuarter = [NSString stringWithFormat:@"%@%@%d",customDate.wm_year,@"06",[[NSNumber numberWithInteger:moth_6_Days] intValue]];
        quarter = 2;
    }else if (month == 7 || month == 8 || month == 9){
        daysForQuarter_3 = moth_7_Days+moth_8_Days+moth_9_Days;
        customDate.wm_daysForQuarter = [NSString stringWithFormat:@"%d",[[NSNumber numberWithInteger:daysForQuarter_3] intValue]];
        customDate.wm_currentQuaterMoths = [NSDictionary dictionaryWithObjectsAndKeys:@"7",@"firstMoth",@"8",@"secondMoth",@"9",@"thirdMoth", nil];
        customDate.wm_startDayForCurrentQuarter = [NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"07",@"01"];
        customDate.wm_lastDayForCurrentQuarter = [NSString stringWithFormat:@"%@%@%d",customDate.wm_year,@"09",[[NSNumber numberWithInteger:moth_9_Days] intValue]];
        quarter = 3;
    }else if (month == 10 || month == 11 || month == 12){
        daysForQuarter_4 = moth_10_Days+moth_11_Days+moth_12_Days;
        customDate.wm_daysForQuarter = [NSString stringWithFormat:@"%d",[[NSNumber numberWithInteger:daysForQuarter_4] intValue]];
        customDate.wm_currentQuaterMoths = [NSDictionary dictionaryWithObjectsAndKeys:@"10",@"firstMoth",@"11",@"secondMoth",@"12",@"thirdMoth", nil];
        customDate.wm_startDayForCurrentQuarter = [NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"10",@"01"];
        customDate.wm_lastDayForCurrentQuarter = [NSString stringWithFormat:@"%@%@%d",customDate.wm_year,@"12",[[NSNumber numberWithInteger:moth_12_Days] intValue]];
        quarter = 4;
    }
    
    customDate.wm_daysForMoth = [NSString stringWithFormat:@"%d",[[NSNumber numberWithUnsignedInteger:[self wm_daysForDate:[NSDate date]]] intValue]];
    customDate.wm_startDayForCurrentMoth = [NSString stringWithFormat:@"%@%@%@",customDate.wm_year,customDate.wm_month,@"01"];
    customDate.wm_lastDayForCurrentMoth = [NSString stringWithFormat:@"%@%@%@",customDate.wm_year,customDate.wm_month,customDate.wm_daysForMoth];
    customDate.wm_lastDayForCurrentYear = [NSString stringWithFormat:@"%@%@%d",customDate.wm_year,@"12",[[NSNumber numberWithInteger:moth_12_Days] intValue]];
    customDate.wm_daysForYear = [NSString stringWithFormat:@"%d",[[NSNumber numberWithInteger:daysForQuarter_1 + daysForQuarter_2 + daysForQuarter_3 + daysForQuarter_4] intValue]];
    customDate.wm_startDayForCurrentYear = [NSString stringWithFormat:@"%@%@%@",customDate.wm_year,@"01",@"01"];
    customDate.wm_quarter = [NSString stringWithFormat:@"%d",[[NSNumber numberWithInteger:quarter] intValue]];
    
    
    
    customDate.wm_yearMothString = [NSString stringWithFormat:@"%@%@",customDate.wm_year,customDate.wm_month];
    customDate.wm_yearMothDayString = [NSString stringWithFormat:@"%@%@",customDate.wm_yearMothString,customDate.wm_day];
    customDate.wm_yearMothDayHoursString = [NSString stringWithFormat:@"%@%@",customDate.wm_yearMothDayString,customDate.wm_hours];
    customDate.wm_yearMothDayHoursMiniuteString = [NSString stringWithFormat:@"%@%@",customDate.wm_yearMothDayHoursString,customDate.wm_miniute];
    customDate.wm_yearMothDayHoursMiniuteSecondsString = [NSString stringWithFormat:@"%@%@",customDate.wm_yearMothDayHoursMiniuteString,customDate.wm_seconds];
    
    return customDate;
}


+ (instancetype)wm_currentYear_Quarter_Moth_Day_Hours_Seconds_Miniute
{
    NSDate *customDate = [[NSDate alloc] wm_initWithCustomDateString:[NSDate wm_currentDateAndTimeConvertToStringWithSpacer:@""]];
    
    customDate = [NSDate wm_currentYear_Quarter_Moth_Day_Hours_Seconds_MiniuteWithDate:customDate];
    
    return customDate;
}

@end
