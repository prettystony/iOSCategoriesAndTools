//
//  UIButton+Category.h
//  UIViewController-Category
//
//  Created by wave on 15/12/11.
//  Copyright © 2015年 wave. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)

-(void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

- (CGSize)sizeWithTitle:(NSString *)title font:(UIFont*)font;

+(id)buttonWithFrame:(CGRect)frame
     backgroundImage:(id)backgroundImage
               title:(NSString *)title
          titleColor:(UIColor *)titleColor
           titleFont:(CGFloat)titleFont
              target:(id)target
              action:(SEL)action
           superview:(id)superview;
@end
