//
//  NSDate+Interval.m
//  日期处理
//
//  Created by hqc on 15/1/12.
//  Copyright © 2015年 hqc. All rights reserved.
//

#import "NSDate+Interval.h"



/****** HQCDateInterval模型 - begin ******/
@implementation HQCDateInterval

@end
/****** HQCDateInterval模型 - end ******/


/****** NSCalendar (Init)  - begin ******/
@implementation NSCalendar (Init)
+ (instancetype)hqc_calendar
{
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        return [NSCalendar currentCalendar];
    }
}
@end
/****** NSCalendar (Init) - end ******/


/****** NSDate (Interval)分类 - begin ******/
@implementation NSDate (Interval)

//- (BOOL)hqc_isInThisYear
//{
//    NSCalendar *calendar = [NSCalendar hqc_calendar];
//    
//    NSInteger nowYear = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]].year;
//    NSInteger selfYear = [calendar components:NSCalendarUnitYear fromDate:self].year;
//    
//    return nowYear == selfYear;
//}
/**
 *  判断是否为今年
 */
- (BOOL)hqc_isInThisYear
{
    NSCalendar *calendar = [NSCalendar hqc_calendar];
    
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    
    // NSDateComponents重写了isEqual:方法, 只要各种元素一样, 那么isEqual:就返回YES
    return [nowCmps isEqual:selfCmps];
}


//- (BOOL)hqc_isInThisYear
//{
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"yyyy";
//    
//    NSString *nowYear = [fmt stringFromDate:[NSDate date]];
//    NSString *selfYear = [fmt stringFromDate:self];
//    
//    // isEqualToString比较字符串内容是否一样
//    return [nowYear isEqualToString:selfYear];
//}
/**
 *  判断是否为今天
 */
- (BOOL)hqc_isInToday
{
    NSCalendar *calendar = [NSCalendar hqc_calendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    // NSDateComponents重写了isEqual:方法, 只要各种元素一样, 那么isEqual:就返回YES
    return [nowCmps isEqual:selfCmps];
//    return nowCmps.year == selfCmps.year
//    && nowCmps.month == selfCmps.month
//    && nowCmps.day == selfCmps.day;
}

//- (BOOL)hqc_isInToday
//{
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"yyyyMMdd";
//
//    NSString *nowYear = [fmt stringFromDate:[NSDate date]]; // 2015-01-13 10:10:10 -> 20150113
//    NSString *selfYear = [fmt stringFromDate:self]; // 2015-01-13 20:30:20 -> 20150113
//
//    // isEqualToString比较字符串内容是否一样
//    return [nowYear isEqualToString:selfYear];
//}
/**
 *  判断是否为昨天
 */
- (BOOL)hqc_isInYesterday
{
    // 判断self是否为昨天
    
    // self == 2015-01-31 23:10:10 -> 2015-01-31 00:00:00
    // now  == 2015-02-01 01:10:10 -> 2015-02-01 00:00:00
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    // 生成只有年月日的字符串(没有时分秒, 时分秒已经被抛弃了)
    NSString *selfString = [fmt stringFromDate:self]; // 20150131
    NSString *nowString = [fmt stringFromDate:[NSDate date]]; // 20150201
    
    // 生成只有年月日的日期(没有时分秒, 时分秒已经被抛弃了)
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [[NSCalendar hqc_calendar] components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}
/**
 *  判断是否为明天
 */
- (BOOL)hqc_isInTomorrow
{    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    // 生成只有年月日的字符串(没有时分秒, 时分秒已经被抛弃了)
    NSString *selfString = [fmt stringFromDate:self]; // 20150131
    NSString *nowString = [fmt stringFromDate:[NSDate date]]; // 20150201
    
    // 生成只有年月日的日期(没有时分秒, 时分秒已经被抛弃了)
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [[NSCalendar hqc_calendar] components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == -1;
}
//通过模型作为返回值,传值
- (HQCDateInterval *)hqc_intervalSinceDate:(NSDate *)anotherDate
{
    // 时间间隔(单位:s)
    NSInteger interval = [self timeIntervalSinceDate:anotherDate];
    
    NSInteger secsPerMinute = 60;
    NSInteger secsPerHour = 60 * secsPerMinute;
    NSInteger secsPerDay = 24 * secsPerHour;
    
    HQCDateInterval *dateInterval = [[HQCDateInterval alloc] init];
    dateInterval.day = interval / secsPerDay;
    dateInterval.hour = (interval % secsPerDay) / secsPerHour;
    dateInterval.minute = ((interval % secsPerDay) % secsPerHour) / secsPerMinute;
    dateInterval.second = interval % secsPerMinute;
    return dateInterval;
}

//通过地址传值
- (void)hqc_intervalSinceDate:(NSDate *)anotherDate day:(NSInteger *)dayP hour:(NSInteger *)hourP minute:(NSInteger *)minuteP second:(NSInteger *)secondP
{
    // 时间间隔(单位:s)
    NSInteger interval = [self timeIntervalSinceDate:anotherDate];
    
    NSInteger secsPerMinute = 60;
    NSInteger secsPerHour = 60 * secsPerMinute;
    NSInteger secsPerDay = 24 * secsPerHour;
    
    *dayP = interval / secsPerDay;
    *hourP = (interval % secsPerDay) / secsPerHour;
    *minuteP = ((interval % secsPerDay) % secsPerHour) / secsPerMinute;
    *secondP = interval % secsPerMinute;
}

@end
/****** NSDate (Interval)分类 - end ******/
