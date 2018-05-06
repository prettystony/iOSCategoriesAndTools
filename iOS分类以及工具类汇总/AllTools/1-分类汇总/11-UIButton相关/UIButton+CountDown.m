//
//  UIButton+CountDown.m
//  iOS分类以及工具类汇总
//
//  Created by ShangYou on 2018/5/3.
//  Copyright © 2018年 YYY. All rights reserved.
//

#import "UIButton+CountDown.h"

@implementation UIButton (CountDown)
- (void)countDown
{
    [self startTime:60 title:@"获取验证码" waitTitle:@"S"];
}

- (void)startTime:(NSInteger)timeout title:(NSString *)title waitTitle:(NSString *)waitTitle
{
    __block NSInteger timeOut=timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:title forState:UIControlStateNormal];
                self.enabled = YES;
                self.alpha = 1;
            });
        }else{
            int seconds = timeOut % 60;
            if (timeOut == 60) {
                seconds = 60;
            }
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //  NSLog(@"____%@",strTime);
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,waitTitle] forState:UIControlStateNormal];
                self.enabled = NO;
                self.alpha = 0.7;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}
@end
