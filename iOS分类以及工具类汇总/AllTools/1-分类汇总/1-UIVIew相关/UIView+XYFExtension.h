

#import <UIKit/UIKit.h>

@interface UIView (XYFExtension)
@property (nonatomic, assign) CGSize xyf_size;
@property (nonatomic, assign) CGFloat xyf_width;
@property (nonatomic, assign) CGFloat xyf_height;
@property (nonatomic, assign) CGFloat xyf_x;
@property (nonatomic, assign) CGFloat xyf_y;
@property (nonatomic, assign) CGFloat xyf_centerX;
@property (nonatomic, assign) CGFloat xyf_centerY;

@property (nonatomic, assign) CGFloat xyf_right;
@property (nonatomic, assign) CGFloat xyf_bottom;

+ (instancetype)viewFromXib;

- (BOOL)intersectWithView:(UIView *)view;
@end
