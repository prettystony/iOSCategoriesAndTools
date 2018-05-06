//
//  UIImage+image.m
//
//
//  Created by 1 on 14/11/17.
//  Copyright © 2014年 hqc. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)

+ (UIImage *)imageWithOriRenderName:(NSString *)imageName{
    
    UIImage *image =  [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return image;
}


@end
