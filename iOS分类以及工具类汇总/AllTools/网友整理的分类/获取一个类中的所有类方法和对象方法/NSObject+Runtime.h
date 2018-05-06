//
//  NSObject+Runtime.h
//  03-获取某个类中所有方法
//
//  Created by hqc on 15/1/7.
//  Copyright © 2016年 hqc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

// 获取实例方法(-号开头的方法)
+ (void)getInstanceMethodList;

// 获取类方法(+号开头开头的方法)
+ (void)getClassMethodList;

@end
