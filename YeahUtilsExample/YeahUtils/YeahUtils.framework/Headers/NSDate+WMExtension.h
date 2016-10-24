//
//  NSDate+WMExtension.h
//  YeahUtils
//
//  Created by WMYeah on 2016/10/11.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate_WMExtension.h"


@interface NSDate (WMExtension)


+ (instancetype)wm_currentYear_Quarter_Moth_Day_Hours_Seconds_Miniute;


/*!
 *  判断时间是否 相等
 *  @param date 目标date对象
 *  @return 返回判断结果
 */
- (BOOL)wm_isSameToDate:(NSDate *)date;

@end
