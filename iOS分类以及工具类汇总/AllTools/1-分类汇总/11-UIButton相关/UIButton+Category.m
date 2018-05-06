//
//  UIButton+Category.m
//  UIViewController-Category
//
//  Created by wave on 15/12/11.
//  Copyright © 2015年 wave. All rights reserved.
//

#import "UIButton+Category.h"
#import "UIImage+Image.h"
@implementation UIButton (Category)

-(void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state{
    [self setBackgroundImage:[self imageWithColor:color] forState:state];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
- (CGSize)sizeWithTitle:(NSString *)title font:(UIFont*)font
{
    self.titleLabel.font = font;
    [self setTitle:title forState:UIControlStateNormal];
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:self.titleLabel.font.fontName size:self.titleLabel.font.pointSize+2]}];
    return titleSize;
}

+(id)buttonWithFrame:(CGRect)frame
     backgroundImage:(id)backgroundImage
               title:(NSString *)title
          titleColor:(UIColor *)titleColor
           titleFont:(CGFloat)titleFont
              target:(id)target
              action:(SEL)action
           superview:(id)superview {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (backgroundImage) {
        
        if ([backgroundImage isKindOfClass:[UIColor class]])
        {
            UIColor *color = (UIColor *)backgroundImage;
            [button setBackgroundImage:[UIImage imageWithColor:color] forState:UIControlStateNormal];
        }else if ([backgroundImage isKindOfClass:[NSString class]])
        {
            [button setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];
        }else{
            [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        }
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (titleFont > 0) {
        button.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    }
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (superview) {
        [superview addSubview:button];
    }
    return button;
}
@end
