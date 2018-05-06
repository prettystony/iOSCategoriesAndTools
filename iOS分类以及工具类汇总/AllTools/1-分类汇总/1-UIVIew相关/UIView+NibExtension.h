

#import <UIKit/UIKit.h>

@interface UIView (NibExtension)

//从nib文件当中加载View.
+ (instancetype)loadFromNib;
/**
 *  返回当前视图, 所处的控制器
 *
 *  @return 控制器
 */
- (UIViewController *)currentViewController;

@end
