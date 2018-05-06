//
//  NSObject+Crash.m
//  TestPredict
//
//  Created by MinLison on 16/5/11.
//  Copyright © 2016年 orgz. All rights reserved.
//

#import "NSObject+Crash.h"
#import <objc/runtime.h>
#import <stdio.h>
#import <string.h>

static inline void swizzledMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{

    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));

    if (didAddMethod)
    {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation NSObject (Crash)

@end
@implementation NSDictionary (Crash)
+ (void)load
{
    swizzledMethod(objc_getClass("__NSPlaceholderDictionary"), @selector(initWithObjects:forKeys:count:), @selector(cz_initWithObjects:forKeys:count:));
    swizzledMethod(objc_getClass("__NSPlaceholderDictionary"), @selector(dictionaryWithObjects:forKeys:count:), @selector(cz_dictionaryWithObjects:forKeys:count:));
}
- (instancetype)cz_initWithObjects:(const id _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying> _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt
{
    @try
    {
        return [self cz_initWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception)
    {
        NSLog(@"-------- %s Crash Because Method %s -------\n",class_getName(self.class),__func__);
        NSLog(@"%@", [exception callStackSymbols]);

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wincompatible-pointer-types-discards-qualifiers"

        __unsafe_unretained id *unsafe_objects = objects;
        __unsafe_unretained id *unsafe_keys = keys;

#pragma clang diagnostic pop

        for (NSUInteger i = 0; i < cnt; i ++)
        {

            if (!unsafe_keys[i])
            {
                unsafe_keys[i] = @"";
            }
            if (!unsafe_objects[i])
            {
                unsafe_objects[i] = @"";
            }
        }
        return [self cz_initWithObjects:unsafe_objects forKeys:unsafe_keys count:cnt];
    }
    @finally
    {
    }
}
+ (instancetype)cz_dictionaryWithObjects:(const id _Nonnull __unsafe_unretained *)objects forKeys:(const id[])keys count:(NSUInteger)cnt
{
    @try {
        return [self cz_dictionaryWithObjects:objects forKeys:keys count:cnt];
    } @catch (NSException *exception) {

        NSLog(@"-------- %s Crash Because Method %s -------\n",class_getName(self.class),__func__);
        NSLog(@"%@", [exception callStackSymbols]);


#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wincompatible-pointer-types-discards-qualifiers"

        __unsafe_unretained id *unsafe_objects = objects;
        __unsafe_unretained id *unsafe_keys = keys;

#pragma clang diagnostic pop

        for (NSUInteger i = 0; i < cnt; i ++)
        {

            if (!unsafe_keys[i])
            {
                unsafe_keys[i] = @"";
            }
            if (!unsafe_objects[i])
            {
                unsafe_objects[i] = @"";
            }
        }

        return [self cz_dictionaryWithObjects:objects forKeys:keys count:cnt];

    }
    @finally
    {
    }
}
@end

@implementation NSArray (Crash)

+ (void)load
{
    swizzledMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:), @selector(cz_objectAtIndex:));
    swizzledMethod(objc_getClass("__NSArrayI"), @selector(arrayWithObjects:count:), @selector(cz_arrayWithObjects:count:));
}

+ (instancetype)cz_arrayWithObjects:(const id _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt
{
    @try
    {
        return [self cz_arrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception)
    {
        NSLog(@"-------- %s Crash Because Method %s -------\n",class_getName(self.class),__func__);
        NSLog(@"%@", [exception callStackSymbols]);


#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wincompatible-pointer-types-discards-qualifiers"

        __unsafe_unretained id *unsafe_objects = objects;

#pragma clang diagnostic pop


        for (NSUInteger i = 0; i < cnt; i ++) {
            if (!unsafe_objects[i])
            {
                unsafe_objects[i] = @"";
            }
        }

        return [self cz_arrayWithObjects:objects count:cnt];

    }
    @finally
    {
    }

}

- (id)cz_objectAtIndex:(NSUInteger)index {
    if (self.count - 1 > index) {
        @try {
            return[self cz_objectAtIndex:index];
        }
        @catch (NSException *exception) {
            NSLog(@"-------- %s Crash Because Method %s -------\n",class_getName(self.class),__func__);
            NSLog(@"%@", [exception callStackSymbols]);
            return nil;
        }
        @finally
        {
        }
    }else {
        return [self cz_objectAtIndex:index];
    }
}
@end

@implementation NSMutableArray (Crash)

+(void)load
{
    swizzledMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:), @selector(cz_objectAtIndex:));
    swizzledMethod(objc_getClass("__NSArrayM"), @selector(setObject:atIndexedSubscript:), @selector(cz_setObject:atIndexedSubscript:));
}

- (id)cz_objectAtIndex:(NSUInteger)index {

    if (self.count - 1 > index)
    {
        @try {
            return[self cz_objectAtIndex:index];
        }
        @catch (NSException *exception) {
            NSLog(@"-------- %s Crash Because Method %s -------\n",class_getName(self.class),__func__);
            NSLog(@"%@", [exception callStackSymbols]);
            return nil;
        }
        @finally
        {
        }
    }
    else
    {
        return [self cz_objectAtIndex:index];
    }
}

- (void)cz_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
    if (obj == nil || idx > self.count - 1)
    {
        @try
        {
            [self cz_setObject:obj atIndexedSubscript:idx];
        }
        @catch (NSException *exception)
        {
            NSLog(@"-------- %s Crash Because Method %s -------\n",class_getName(self.class),__func__);
            NSLog(@"%@", [exception callStackSymbols]);

        } @finally {

        }

    }
    else
    {
        [self cz_setObject:obj atIndexedSubscript:idx];
    }

}

@end
@implementation NSMutableDictionary (Crash)

+ (void)load
{
    swizzledMethod(objc_getClass("__NSDictionaryM"), @selector(setObject:forKey:), @selector(cz_setObject:forKey:));
}

- (void)cz_setObject:(id)czObject forKey:(NSString *)key {

    if (czObject == nil || key == nil) {
        @try {
            [self cz_setObject:czObject forKey:key];
        }
        @catch (NSException *exception) {
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            NSLog(@"%@", [exception callStackSymbols]);
            czObject = [NSString stringWithFormat:@""];
            [self cz_setObject:czObject forKey:key];
        }
        @finally {}
    }else {
        [self cz_setObject:czObject forKey:key];
    }
}
@end