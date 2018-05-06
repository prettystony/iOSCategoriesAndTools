//
//  UIImage+circleImage.h
//  百思不得姐
//
//  Created by hqc on 16/1/2.
//  Copyright © 2016年 hqc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (circleImage)

/**
 * 返回一张圆形图片
 */
- (instancetype)circleImage;

/**
 * 返回一张圆形图片
 */
+ (instancetype)circleImageNamed:(NSString *)name;

@end
