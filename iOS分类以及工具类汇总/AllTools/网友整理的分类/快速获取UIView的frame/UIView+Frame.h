//
//  UIView+Frame.h
//
//
//  Created by 1 on 14/11/17.
//  Copyright © 2014年 hqc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

//self.width;
//self.width = 10;
//self.height;
//self.height = 10;
//self.x = ;
//self.y = ;

@property (nonatomic ,assign) CGFloat width;

@property (nonatomic ,assign) CGFloat height;

@property (nonatomic ,assign) CGFloat x;

@property (nonatomic ,assign) CGFloat y;

@property (assign, nonatomic) CGSize size;

@property (assign, nonatomic) CGPoint origin;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@end
