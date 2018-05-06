
#import <UIKit/UIKit.h>

@interface UIImage (Image)
    
// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (instancetype)imageOriginalWithName:(NSString *)imageName;

- (instancetype)circleImage;

+ (instancetype)circleImageNamed:(NSString *)name;
/**
 *  生成一张带有边框的圆形图片
 *
 *  @param borderW     边框宽度
 *  @param borderColor 边框颜色
 *  @param image       要添加边框的图片
 *
 *  @return 生成的带有边框的圆形图片
 */
+ (UIImage *)imageWithBorder:(CGFloat)borderW color:(UIColor *)borderColor image:(UIImage *)image;
@end
