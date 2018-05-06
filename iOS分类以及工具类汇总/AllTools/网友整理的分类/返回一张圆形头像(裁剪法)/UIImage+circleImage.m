//
//  UIImage+circleImage.m
//  百思不得姐
//
//  Created by hqc on 16/1/2.
//  Copyright © 2016年 hqc. All rights reserved.
//

#import "UIImage+circleImage.h"

@implementation UIImage (circleImage)
/**
 * 对象方法,返回一张圆形图片
 */
- (instancetype)circleImage{
    //开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    //获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //矩形框
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    //添加一个圆
    CGContextAddEllipseInRect(ctx, rect);
    // 裁剪(裁剪成刚才添加的图形形状)
    CGContextClip(ctx);
    //往圆上添加一张图片
    [self drawInRect:rect];
    //获得上下文中生成的图片
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
}

/**
 * 类方法,返回一张圆形图片
 */
+ (instancetype)circleImageNamed:(NSString *)name{

    return [[self circleImageNamed:name] circleImage];
}

@end
