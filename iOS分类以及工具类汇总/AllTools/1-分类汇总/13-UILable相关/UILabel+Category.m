//
//  UILabel+Category.m
//  iOS分类以及工具类汇总
//
//  Created by ShangYou on 2018/5/3.
//  Copyright © 2018年 YYY. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)
+ (id)labelWithFrame:(CGRect)frame
                text:(NSString *)text
           textColor:(UIColor *)textColor
            textFont:(float)textFont
            fitWidth:(BOOL)fitWidth
           superview:(id)superview {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (text.length > 0) {
        label.text = text;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    if (textFont > 0) {
        label.font = [UIFont systemFontOfSize:textFont];
    }
    if (fitWidth) {
        label.adjustsFontSizeToFitWidth = YES;
    }else {
        label.adjustsFontSizeToFitWidth = NO;
    }
    label.textAlignment = NSTextAlignmentLeft;
    if (superview) {
        [superview addSubview:label];
    }
    return label;
}


/*
 UILabel* 展示的控件
 (NSString*)str  内容
 withFont:(float)font 字体大小
 WithSpace:(float)space 行间距
 */
//给UILabel设置行间距和字间距
-(void)setLabelSpaceWithValue:(NSString*)str withFont:(float)font WithSpace:(float)space{
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = space; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    UIFont *tfont = [UIFont systemFontOfSize:font];
    NSDictionary *dic = @{NSFontAttributeName:tfont, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    self.attributedText = attributeStr;
}



/*
 计算UILabel的高度(带有行间距的情况)
 (NSString*)str  内容
 withFont:(float)font 字体大小
 WithSpace:(float)space 行间距
 (CGFloat)width  UILable的宽度
 */
//计算UILabel的高度(带有行间距的情况)
-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(float)font withWidth:(CGFloat)width WithSpace:(float)space{
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = space;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    UIFont *tfont = [UIFont systemFontOfSize:font];
    NSDictionary *dic = @{NSFontAttributeName:tfont, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height;
}
@end
