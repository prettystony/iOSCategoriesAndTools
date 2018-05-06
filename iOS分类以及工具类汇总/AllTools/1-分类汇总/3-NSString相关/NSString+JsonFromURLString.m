//
//  NSString+JsonFromURLString.m
//  SP2P_9
//
//  Created by ShangYou on 2018/1/10.
//  Copyright © 2018年 EIMS. All rights reserved.
//

#import "NSString+JsonFromURLString.h"

@implementation NSString (JsonFromURLString)


- (NSDictionary *)jsonDictFromURLString:(NSString *)URLString {
    
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    //1、根据 & 切割成数组
    NSArray *dictList = @[];
    if ([URLString containsString:@"&"]) {
        dictList = [URLString componentsSeparatedByString:@"&"];
    }
    
    //2、每个数组元素，根据 = 切割，前面是 key， 后面是 value
    if (dictList.count == 0) {
        
        return @{};
    }
    for (NSString *dictString in dictList) {
        
        if ([dictString containsString:@"="]) {
            
            NSRange range = [dictString rangeOfString:@"="];
            NSString *keyString = [dictString substringWithRange:NSMakeRange(0, range.location)];
            
            NSRange valueRange = NSMakeRange(range.location + 1, dictString.length - range.location -1);
            NSString *valurString = [dictString substringWithRange:valueRange];
            
            [resultDict setValue:valurString forKey:keyString];
        }
        
    }
    return resultDict;
}


@end
