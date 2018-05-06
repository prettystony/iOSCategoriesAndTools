//
//  NSDate+Interval.h
//  日期处理
//
//  Created by hqc on 15/1/12.
//  Copyright © 2015年 hqc. All rights reserved.
//

#import <UIKit/UIKit.h>

/****** HQCDateInterval模型 - begin ******/
@interface HQCDateInterval : NSObject
/** 相隔多少天 */
@property (nonatomic, assign) NSInteger day;
/** 相隔多少小时 */
@property (nonatomic, assign) NSInteger hour;
/** 相隔多少分钟 */
@property (nonatomic, assign) NSInteger minute;
/** 相隔多少秒 */
@property (nonatomic, assign) NSInteger second;
@end
/****** HQCDateInterval模型 - end ******/


/****** NSDate (Interval)分类 - begin ******/
@interface NSDate (Interval)
/**
 *  判断是否为今天
 */
- (BOOL)hqc_isInToday;
/**
 *  判断是否为昨天
 */
- (BOOL)hqc_isInYesterday;
/**
 *  判断是否为明天
 */
- (BOOL)hqc_isInTomorrow;
/**
 *  判断是否为今年
 */
- (BOOL)hqc_isInThisYear;

/**
 *  计算self和anotherDate之间的时间间隔,返回值为HQCDateInterval模型
 */
- (HQCDateInterval *)hqc_intervalSinceDate:(NSDate *)anotherDate;

- (void)hqc_intervalSinceDate:(NSDate *)anotherDate day:(NSInteger *)dayP hour:(NSInteger *)hourP minute:(NSInteger *)minuteP second:(NSInteger *)secondP;
@end
/****** NSDate (Interval)分类 - begin ******/
