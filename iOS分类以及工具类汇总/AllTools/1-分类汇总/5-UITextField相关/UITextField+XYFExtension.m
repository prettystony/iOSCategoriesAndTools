

#import "UITextField+XYFExtension.h"

static NSString * const XYFPlaceholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (XYFExtension)

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    // 提前设置占位文字, 目的 : 让它提前创建placeholderLabel
    NSString *oldPlaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = oldPlaceholder;
    
    // 恢复到默认的占位文字颜色
    if (placeholderColor == nil) {
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    
    // 设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:XYFPlaceholderColorKey];
}

- (UIColor *)placeholderColor
{
    return [self valueForKeyPath:XYFPlaceholderColorKey];
}

@end
