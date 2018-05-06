//
//  AutoArchiveUnarchiveObject.m
//  iOS分类以及工具类汇总
//
//  Created by stony on 2018/5/4.
//  Copyright © 2018年 XYF. All rights reserved.
//

#import "AutoArchiveUnarchiveObject.h"
#import <objc/runtime.h>
@implementation AutoArchiveUnarchiveObject
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    //获取成员变量列表
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        // 获取成员变量名
        const void *name = ivar_getName(ivar);
        NSString *ivarName = [NSString stringWithUTF8String:name];
        //KVC 根据成员变量名获取成员变量值
        id value = [self valueForKey:ivarName];
        //编码
        [aCoder encodeObject:value forKey:ivarName];
    }
    free(ivars);
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        unsigned int count = 0;
        //获取成员变量列表
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (unsigned int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            // 获取成员变量名
            const void *name = ivar_getName(ivar);
            NSString *ivarName = [NSString stringWithUTF8String:name];
            //解码
            id value = [aDecoder decodeObjectForKey:ivarName];
            //KVC 根据成员变量名给成员变量赋值
            if (value != nil) {
                [self setValue:value forKey:ivarName];
            }
        }
        free(ivars);
    }
    return self;
}
@end
