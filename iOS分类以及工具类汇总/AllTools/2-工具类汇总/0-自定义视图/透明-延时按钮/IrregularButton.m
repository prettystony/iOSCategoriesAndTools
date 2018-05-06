//
//  IrregularButton.m
//  DrumSolo2
//
//  Created by ZHANGYONG on 2017/11/30.
//  Copyright © 2017年 shenleyang. All rights reserved.
//

#import "IrregularButton.h"

@implementation IrregularButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGFloat alpha = [self alphaAtPixel:point];
    if (alpha >= 1)
    {
        return YES;
    }
    
    return NO;
}

- (CGFloat)alphaAtPixel:(CGPoint)point
{
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height), point))
    {
        return 0;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = self.currentBackgroundImage.CGImage;
    NSUInteger width = self.frame.size.width;
    NSUInteger height = self.frame.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 1,
                                                 1,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast |     kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    
    return alpha;
}

@end
