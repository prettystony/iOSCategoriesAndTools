

#import <UIKit/UIKit.h>
/*
 *  水印方向
 */
typedef enum {
    //左上
    ImageWaterDirectTopLeft=0,
    
    //右上
    ImageWaterDirectTopRight,
    
    //左下
    ImageWaterDirectBottomLeft,
    
    //右下
    ImageWaterDirectBottomRight,
    
    //正中
    ImageWaterDirectCenter
}ImageWaterDirect;

@interface UIImage (wateMark)

/**
 *  文字水印
 *
 *  @param text      文字
 *  @param direction 文字方向
 *  @param fontColor 文字颜色
 *  @param fontPoint 字体
 *  @param marginXY   对齐点
 *
 *  @return 结果
 */
- (UIImage *)waterWithText:(NSString *)text
                 direction:(ImageWaterDirect)direction
                 fontColor:(UIColor *)fontColor
                 fontPoint:(CGFloat)fontPoint
                  marginXY:(CGPoint)marginXY;


/**
 *  绘制图片水印
 *
 *  @param waterImage 图片水印
 *  @param direction  方向
 *  @param waterSize  水印大小
 *  @param marginXY   对齐点
 *
 *  @return 结果
 */
- (UIImage *)waterWithWaterImage:(UIImage *)waterImage
                       direction:(ImageWaterDirect)direction
                       waterSize:(CGSize)waterSize
                        marginXY:(CGPoint)marginXY;


/**
 *  文字水印位置
 *
 *  @param str       字符串
 *  @param attr      字符串属性
 *  @param direction 方向
 *  @param rect      图片Rect
 *  @param marginXY  对齐点
 *
 *  @return 结果
 */
- (CGRect)calWidth:(NSString *)str
              attr:(NSDictionary *)attr
         direction:(ImageWaterDirect)direction
              rect:(CGRect)rect
          marginXY:(CGPoint)marginXY;

/**
 *  计算水印位置
 *
 *  @param rect      图片rect
 *  @param size      size
 *  @param direction 文字方向
 *  @param marginXY   对齐点
 *
 *  @return 结果
 */
- (CGRect)rectWithRect:(CGRect)rect
                  size:(CGSize)size
             direction:(ImageWaterDirect)direction
              marginXY:(CGPoint)marginXY;

@end
