//
//  NSDate_WMExtension.h
//  YeahUtils
//
//  Created by WMYeah on 2016/10/12.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate ()

@property (nonatomic, strong) NSString *wm_year;
@property (nonatomic, strong) NSString *wm_quarter;
@property (nonatomic, strong) NSString *wm_month;
@property (nonatomic, strong) NSString *wm_day;
@property (nonatomic, strong) NSString *wm_hours;
@property (nonatomic, strong) NSString *wm_miniute;
@property (nonatomic, strong) NSString *wm_seconds;

@property (nonatomic, strong) NSString *wm_yearMothString;
@property (nonatomic, strong) NSString *wm_yearMothDayString;
@property (nonatomic, strong) NSString *wm_yearMothDayHoursString;
@property (nonatomic, strong) NSString *wm_yearMothDayHoursMiniuteString;
@property (nonatomic, strong) NSString *wm_yearMothDayHoursMiniuteSecondsString;

@property (nonatomic, strong) NSString *wm_daysForMoth;
@property (nonatomic, strong) NSString *wm_daysForQuarter;
@property (nonatomic, strong) NSString *wm_daysForYear;
@property (nonatomic, strong) NSString *wm_lastDayForCurrentMoth;       //本月最后一天日期
@property (nonatomic, strong) NSString *wm_lastDayForCurrentQuarter;    //本季度最后一天日期
@property (nonatomic, strong) NSString *wm_lastDayForCurrentYear;       //本年最后一天日期
@property (nonatomic, strong) NSString *wm_startDayForCurrentMoth;      //本月开始日期
@property (nonatomic, strong) NSString *wm_startDayForCurrentQuarter;      //本月开始日期

/**
 本月开始日期
 */
@property (nonatomic, strong) NSString *wm_startDayForCurrentYear;

/**
 当前季度及月份字典
 */
@property (nonatomic, strong) NSDictionary *wm_currentQuaterMoths;

@end
