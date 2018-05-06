//
//  UIButton+CountDown.h
//  iOS分类以及工具类汇总
//
//  Created by ShangYou on 2018/5/3.
//  Copyright © 2018年 XYF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)
- (void)countDown;

- (void)startTime:(NSInteger)timeout title:(NSString *)title waitTitle:(NSString *)waitTitle;
@end
