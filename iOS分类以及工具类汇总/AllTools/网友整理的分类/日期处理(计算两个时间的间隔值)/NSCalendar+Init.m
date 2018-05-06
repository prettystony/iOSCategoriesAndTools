//
//  NSCalendar+Init.m
//  日期处理
//
//  Created by hqc on 15/1/13.
//  Copyright © 2015年 hqc. All rights reserved.
//

#import "NSCalendar+Init.h"

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
