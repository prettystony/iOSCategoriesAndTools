//
//  NSString+Url.m
//  DrumSolo2
//
//  Created by ZHANGYONG on 2017/10/26.
//  Copyright © 2017年 shenleyang. All rights reserved.
//

#import "NSString+Url.h"

@implementation NSString (Url)

- (NSString *)URLEncodedString
{
    NSCharacterSet *characterSet = [NSCharacterSet  URLQueryAllowedCharacterSet];
    NSString *result = [self stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    return result;
}

@end
