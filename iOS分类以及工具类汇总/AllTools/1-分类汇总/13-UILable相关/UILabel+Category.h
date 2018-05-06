//
//  UILabel+Category.h
//  iOS分类以及工具类汇总
//
//  Created by ShangYou on 2018/5/3.
//  Copyright © 2018年 YYY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)
+ (id)labelWithFrame:(CGRect)frame
                text:(NSString *)text
           textColor:(UIColor *)textColor
            textFont:(float)textFont
            fitWidth:(BOOL)fitWidth
           superview:(id)superview;

//给UILabel设置行间距和字间距
//-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(float)font WithSpace:(float)space;
/*
 UILabel* 展示的控件
 (NSString*)str  内容
 withFont:(float)font 字体大小
 WithSpace:(float)space 行间距
 */
//给UILabel设置行间距和字间距
-(void)setLabelSpaceWithValue:(NSString*)str withFont:(float)font WithSpace:(float)space;

//计算UILabel的高度(带有行间距的情况)
-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(float)font withWidth:(CGFloat)width WithSpace:(float)space;
@end
