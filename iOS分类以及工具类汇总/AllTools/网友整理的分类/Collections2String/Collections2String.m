//
//  Collections2String.m
//  temp
//
//  Created by SA on 15/10/10.
//  Copyright © 2015年 tbs. All rights reserved.
//

#import "Collections2String.h"
//三个分类要实现的方法及方法体是一样的,但因为最近的共同父类时NSObject,但是范围太大了,就逐个搞
@implementation NSArray(String)

-(BOOL)isCollections:(id)obj{
    if ([obj isKindOfClass:[NSArray class]] ||
        [obj isKindOfClass:[NSSet class]] ||
        [obj isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    return NO;
}

-(void)strMAddPrefix:(NSMutableString*)result forObj:(id)obj{
    //根据所属类,确定开头字符串
    if ([obj isKindOfClass:[NSSet class]]) {
        [result appendString:@"{("];
        
    }else if([obj isKindOfClass:[NSArray class]]){
        [result appendString:@"("];
    }else {
        [result appendString:@"{"];
    }
    [result appendString:@"\n"];
}

-(void)strM:(NSMutableString*)result addDeepLevel:(int)deepLevel spaces:(NSString*)spaces{
    //追加相应深度的spaces
    for (int i=0; i<deepLevel; i++) {
        [result appendString:spaces];
    }
}

-(void)strMAddSubfix:(NSMutableString*)result forObj:(id)obj{
    //根据所属类,确定结尾字符串
    if ([obj isKindOfClass:[NSSet class]]) {
        [result appendString:@")}"];
    }else if([obj isKindOfClass:[NSArray class]]){
        [result appendString:@")"];
    }else {
        [result appendString:@"}"];
    }
    
}

//遍历每一个元素来合成新数组(这里不用再去考虑元素或者key或者value是集合了,因为已经做过预防非集合元素的处理了,让它撒欢跑吧!🏃)
-(void)strMAddElements:(NSMutableString*)result forObj:(id)obj withDeepLevel:(int)deepLevel withSpaces:(NSString*)spaces{
    
    for (id element in obj) {
        //如果是字典,就是用自定义的形式,而且如果不处理只输出dict1等
        if ([obj isKindOfClass:[NSDictionary class]]) {
            [result appendFormat:@"%@ : %@ ",
             [self Collections2String:element deepLevel:deepLevel+1],
             [self Collections2String:obj[element] deepLevel:deepLevel+1]
             ];
        }else{
            [result appendString:[self Collections2String:element deepLevel:deepLevel+1]];
        }
        [result appendString:@",\n"];
        //追加相应深度的spaces
        [self strM:result addDeepLevel:deepLevel spaces:spaces];
    }
    
    //删除最后多出的",\n及deepLevel空格"
    [result deleteCharactersInRange:NSMakeRange(result.length-spaces.length*deepLevel-2,spaces.length*deepLevel+2)];
    
    [result appendString:@"\n"];
}

-(NSString*)Collections2String:(id)obj deepLevel:(int)deepLevel{
    //如果不是集合就返回description值(这里起初是为了预防非集合元素,到后边发现可以在for-in遍历元素的时候提供很大的便利,beer!🍺)
    if (![self isCollections:obj]) {
        return [obj description];
    }
    
    //目标字符串可变
    NSMutableString* result = [NSMutableString string];
    NSString* spaces = @"    ";
    
    //根据所属类,确定开头字符串
    [self strMAddPrefix:result forObj:obj];
    
    //追加相应深度的spaces
    [self strM:result addDeepLevel:deepLevel spaces:spaces];
    
    
    //遍历每一个元素来合成新数组(这里不用再去考虑元素或者key或者value是集合了,因为已经做过预防非集合元素的处理了,让它撒欢跑吧!🏃)
    [self strMAddElements:result forObj:obj withDeepLevel:deepLevel withSpaces:spaces];
    
    //追加相应深度的spaces
    [self strM:result addDeepLevel:deepLevel-1 spaces:spaces];
    
    //根据所属类,确定结尾字符串
    [self strMAddSubfix:result forObj:obj];
    
    //返回结果
    return result;
}

-(NSString*)Collections2String{
    return [self Collections2String:self deepLevel:1];
}

@end

@implementation NSSet(String)

-(BOOL)isCollections:(id)obj{
    if ([obj isKindOfClass:[NSArray class]] ||
        [obj isKindOfClass:[NSSet class]] ||
        [obj isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    return NO;
}

-(void)strMAddPrefix:(NSMutableString*)result forObj:(id)obj{
    //根据所属类,确定开头字符串
    if ([obj isKindOfClass:[NSSet class]]) {
        [result appendString:@"{("];
        
    }else if([obj isKindOfClass:[NSArray class]]){
        [result appendString:@"("];
    }else {
        [result appendString:@"{"];
    }
    [result appendString:@"\n"];
}

-(void)strM:(NSMutableString*)result addDeepLevel:(int)deepLevel spaces:(NSString*)spaces{
    //追加相应深度的spaces
    for (int i=0; i<deepLevel; i++) {
        [result appendString:spaces];
    }
}

-(void)strMAddSubfix:(NSMutableString*)result forObj:(id)obj{
    //根据所属类,确定结尾字符串
    if ([obj isKindOfClass:[NSSet class]]) {
        [result appendString:@")}"];
    }else if([obj isKindOfClass:[NSArray class]]){
        [result appendString:@")"];
    }else {
        [result appendString:@"}"];
    }
    
}

//遍历每一个元素来合成新数组(这里不用再去考虑元素或者key或者value是集合了,因为已经做过预防非集合元素的处理了,让它撒欢跑吧!🏃)
-(void)strMAddElements:(NSMutableString*)result forObj:(id)obj withDeepLevel:(int)deepLevel withSpaces:(NSString*)spaces{
    
    for (id element in obj) {
        //如果是字典,就是用自定义的形式,而且如果不处理只输出dict1等
        if ([obj isKindOfClass:[NSDictionary class]]) {
            [result appendFormat:@"%@ : %@ ",
             [self Collections2String:element deepLevel:deepLevel+1],
             [self Collections2String:obj[element] deepLevel:deepLevel+1]
             ];
        }else{
            [result appendString:[self Collections2String:element deepLevel:deepLevel+1]];
        }
        [result appendString:@",\n"];
        //追加相应深度的spaces
        [self strM:result addDeepLevel:deepLevel spaces:spaces];
    }
    
    //删除最后多出的",\n及deepLevel空格"
    [result deleteCharactersInRange:NSMakeRange(result.length-spaces.length*deepLevel-2,spaces.length*deepLevel+2)];
    
    [result appendString:@"\n"];
}

-(NSString*)Collections2String:(id)obj deepLevel:(int)deepLevel{
    //如果不是集合就返回description值(这里起初是为了预防非集合元素,到后边发现可以在for-in遍历元素的时候提供很大的便利,beer!🍺)
    if (![self isCollections:obj]) {
        return [obj description];
    }
    
    //目标字符串可变
    NSMutableString* result = [NSMutableString string];
    NSString* spaces = @"    ";
    
    //根据所属类,确定开头字符串
    [self strMAddPrefix:result forObj:obj];
    
    //追加相应深度的spaces
    [self strM:result addDeepLevel:deepLevel spaces:spaces];
    
    
    //遍历每一个元素来合成新数组(这里不用再去考虑元素或者key或者value是集合了,因为已经做过预防非集合元素的处理了,让它撒欢跑吧!🏃)
    [self strMAddElements:result forObj:obj withDeepLevel:deepLevel withSpaces:spaces];
    
    //追加相应深度的spaces
    [self strM:result addDeepLevel:deepLevel-1 spaces:spaces];
    
    //根据所属类,确定结尾字符串
    [self strMAddSubfix:result forObj:obj];
    
    //返回结果
    return result;
}

-(NSString*)Collections2String{
    return [self Collections2String:self deepLevel:1];
}

@end

@implementation NSDictionary(String)

-(BOOL)isCollections:(id)obj{
    if ([obj isKindOfClass:[NSArray class]] ||
        [obj isKindOfClass:[NSSet class]] ||
        [obj isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    return NO;
}

-(void)strMAddPrefix:(NSMutableString*)result forObj:(id)obj{
    //根据所属类,确定开头字符串
    if ([obj isKindOfClass:[NSSet class]]) {
        [result appendString:@"{("];
        
    }else if([obj isKindOfClass:[NSArray class]]){
        [result appendString:@"("];
    }else {
        [result appendString:@"{"];
    }
    [result appendString:@"\n"];
}

-(void)strM:(NSMutableString*)result addDeepLevel:(int)deepLevel spaces:(NSString*)spaces{
    //追加相应深度的spaces
    for (int i=0; i<deepLevel; i++) {
        [result appendString:spaces];
    }
}

-(void)strMAddSubfix:(NSMutableString*)result forObj:(id)obj{
    //根据所属类,确定结尾字符串
    if ([obj isKindOfClass:[NSSet class]]) {
        [result appendString:@")}"];
    }else if([obj isKindOfClass:[NSArray class]]){
        [result appendString:@")"];
    }else {
        [result appendString:@"}"];
    }
    
}

//遍历每一个元素来合成新数组(这里不用再去考虑元素或者key或者value是集合了,因为已经做过预防非集合元素的处理了,让它撒欢跑吧!🏃)
-(void)strMAddElements:(NSMutableString*)result forObj:(id)obj withDeepLevel:(int)deepLevel withSpaces:(NSString*)spaces{
    
    for (id element in obj) {
        //如果是字典,就是用自定义的形式,而且如果不处理只输出dict1等
        if ([obj isKindOfClass:[NSDictionary class]]) {
            [result appendFormat:@"%@ : %@ ",
             [self Collections2String:element deepLevel:deepLevel+1],
             [self Collections2String:obj[element] deepLevel:deepLevel+1]
             ];
        }else{
            [result appendString:[self Collections2String:element deepLevel:deepLevel+1]];
        }
        [result appendString:@",\n"];
        //追加相应深度的spaces
        [self strM:result addDeepLevel:deepLevel spaces:spaces];
    }
    
    //删除最后多出的",\n及deepLevel空格"
    [result deleteCharactersInRange:NSMakeRange(result.length-spaces.length*deepLevel-2,spaces.length*deepLevel+2)];
    
    [result appendString:@"\n"];
}

-(NSString*)Collections2String:(id)obj deepLevel:(int)deepLevel{
    //如果不是集合就返回description值(这里起初是为了预防非集合元素,到后边发现可以在for-in遍历元素的时候提供很大的便利,beer!🍺)
    if (![self isCollections:obj]) {
        return [obj description];
    }
    
    //目标字符串可变
    NSMutableString* result = [NSMutableString string];
    NSString* spaces = @"    ";
    
    //根据所属类,确定开头字符串
    [self strMAddPrefix:result forObj:obj];
    
    //追加相应深度的spaces
    [self strM:result addDeepLevel:deepLevel spaces:spaces];
    
    
    //遍历每一个元素来合成新数组(这里不用再去考虑元素或者key或者value是集合了,因为已经做过预防非集合元素的处理了,让它撒欢跑吧!🏃)
    [self strMAddElements:result forObj:obj withDeepLevel:deepLevel withSpaces:spaces];
    
    //追加相应深度的spaces
    [self strM:result addDeepLevel:deepLevel-1 spaces:spaces];
    
    //根据所属类,确定结尾字符串
    [self strMAddSubfix:result forObj:obj];
    
    //返回结果
    return result;
}

-(NSString*)Collections2String{
    return [self Collections2String:self deepLevel:1];
}

@end