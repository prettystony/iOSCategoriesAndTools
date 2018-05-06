//
//  TouchEnlargeButton.m
//  DrumSolo2
//
//  Created by ZHANGYONG on 2018/2/11.
//  Copyright © 2018年 shenleyang. All rights reserved.
//

#import "TouchEnlargeButton.h"

@implementation TouchEnlargeButton

- (void)setTouchEnlargeScale:(float)scale
{
    _touchEnlargeScale = scale;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect bounds = self.bounds;
    CGFloat widthDelta = MAX(bounds.size.width*_touchEnlargeScale - bounds.size.width, 0);
    CGFloat heightDelta = MAX(bounds.size.height*_touchEnlargeScale - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}

@end
