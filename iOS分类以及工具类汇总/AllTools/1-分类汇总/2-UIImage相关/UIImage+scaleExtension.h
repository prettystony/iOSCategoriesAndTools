

#import <UIKit/UIKit.h>

@interface UIImage (scaleExtension)

//UIImage等比例缩放
+(UIImage *)scaleImage:(UIImage *)image toScale:(CGFloat)scaleSize;

//UIImage自定长宽缩放
+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

@end
