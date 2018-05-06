

#import "UIView+XYFExtension.h"

@implementation UIView (XYFExtension)

- (CGSize)xyf_size
{
    return self.frame.size;
}

- (void)setXyf_size:(CGSize)xyf_size
{
    CGRect frame = self.frame;
    frame.size = xyf_size;
    self.frame = frame;
}

- (CGFloat)xyf_width
{
    return self.frame.size.width;
}

- (CGFloat)xyf_height
{
    return self.frame.size.height;
}

- (void)setXyf_width:(CGFloat)xyf_width
{
    CGRect frame = self.frame;
    frame.size.width = xyf_width;
    self.frame = frame;
}

- (void)setXyf_height:(CGFloat)xyf_height
{
    CGRect frame = self.frame;
    frame.size.height = xyf_height;
    self.frame = frame;
}

- (CGFloat)xyf_x
{
    return self.frame.origin.x;
}

- (void)setXyf_x:(CGFloat)xyf_x
{
    CGRect frame = self.frame;
    frame.origin.x = xyf_x;
    self.frame = frame;
}

- (CGFloat)xyf_y
{
    return self.frame.origin.y;
}

- (void)setXyf_y:(CGFloat)xyf_y
{
    CGRect frame = self.frame;
    frame.origin.y = xyf_y;
    self.frame = frame;
}

- (CGFloat)xyf_centerX
{
    return self.center.x;
}

- (void)setXyf_centerX:(CGFloat)xyf_centerX
{
    CGPoint center = self.center;
    center.x = xyf_centerX;
    self.center = center;
}

- (CGFloat)xyf_centerY
{
    return self.center.y;
}

- (void)setXyf_centerY:(CGFloat)xyf_centerY
{
    CGPoint center = self.center;
    center.y = xyf_centerY;
    self.center = center;
}

- (CGFloat)xyf_right
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)xyf_bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setXyf_right:(CGFloat)xyf_right
{
    self.xyf_x = xyf_right - self.xyf_width;
}

- (void)setXyf_bottom:(CGFloat)xyf_bottom
{
    self.xyf_y = xyf_bottom - self.xyf_height;
}

+ (instancetype)viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (BOOL)intersectWithView:(UIView *)view
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect selfRect = [self convertRect:self.bounds toView:window];
    CGRect viewRect = [view convertRect:view.bounds toView:window];
    return CGRectIntersectsRect(selfRect, viewRect);
}
@end
