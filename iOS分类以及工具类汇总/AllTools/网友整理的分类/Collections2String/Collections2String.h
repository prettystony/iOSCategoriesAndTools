//
//  Collections2String.h
//  temp
//
//  Created by SA on 15/10/10.
//  Copyright © 2015年 tbs. All rights reserved.
//

#import <Foundation/Foundation.h>
//三个分类要实现的方法及方法体是一样的,但因为最近的共同父类时NSObject,但是范围太大了,就逐个搞
@interface NSArray(String)
-(NSString*)Collections2String;
@end

@interface NSSet(String)
-(NSString*)Collections2String;
@end

@interface NSDictionary(String)
-(NSString*)Collections2String;
@end
