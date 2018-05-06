//
//  WaveButton.m
//  testWaveButton
//
//  Created by 尹岩岩 on 2017/8/22.
//  Copyright © 2017年 尹岩岩. All rights reserved.
//

#import "WaveButton.h"
@interface WaveButton()
@property (strong, nonatomic) UIImage *normalBackImage;
@property (strong, nonatomic) UIImage *highLightImage;
@end
@implementation WaveButton
{
    UIImageView *_backgroundImageView;
    UILabel *_titleLabel;
//    UIImage *_normalBackImage;
//    UIImage *_highLightImage;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _isEnable = YES;
        _backgroundImageView = [[UIImageView alloc] init];
        [self addSubview:_backgroundImageView];
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        [self bringSubviewToFront:_titleLabel];
        
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _isEnable = YES;
        _backgroundImageView = [[UIImageView alloc] init];
        [self addSubview:_backgroundImageView];
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        [self bringSubviewToFront:_titleLabel];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
//    if (self.backColor == nil) {
//        self.backColor = [UIColor grayColor];
//    }
    self.backgroundColor = [UIColor clearColor];
    
    if (self.waveClolr == nil) {
        self.waveClolr = [UIColor whiteColor];
    }
    _backgroundImageView.frame = self.bounds;
    
    _titleLabel.frame = self.bounds;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
}
-(void)setTitle:(NSString *)title withColor:(UIColor *)color andFont:(UIFont *)font
{
    [_titleLabel setText:title];
    [_titleLabel setTextColor:color];
    [_titleLabel setFont:font];
}
-(void)setNormalBackImage:(UIImage *)normalImage andHighlightImage:(UIImage *)highlightImage
{
    _normalBackImage = normalImage;
    _highLightImage = highlightImage;
    _backgroundImageView.image = _normalBackImage;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    _backgroundImageView.image = _highLightImage;
    if (!_isEnable) return;
    
    if (self.btnTouchesBegan != nil) {
        self.btnTouchesBegan();
    }
    self.userInteractionEnabled = NO;
    CGPoint point = [[touches anyObject] locationInView:self];
    for (NSInteger i = 0; i < 1; i++) {
        
        // 1.创建一个圆圈view
        UIView *circleView = [[UIView alloc] init];

        circleView.backgroundColor = self.waveClolr;
        circleView.frame = CGRectMake(point.x + self.frame.origin.x, point.y + self.frame.origin.y, 20, 20);
        
        [self.superview addSubview:circleView];
        circleView.layer.cornerRadius = circleView.frame.size.width * 0.5;
        
        circleView.layer.masksToBounds = YES;
        self.clipsToBounds = YES;
        
        // 让每一个圆圈延迟时间不一样
        [UIView animateWithDuration:0.5 delay:i * 0.2 options:0 animations:^{
            circleView.transform = CGAffineTransformMakeScale(5, 5);
            circleView.alpha = 0;
        } completion:^(BOOL finished) {
            [circleView removeFromSuperview];
        }];
    }
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.btnClicked != nil) {
            weakSelf.userInteractionEnabled = YES;
            weakSelf.btnClicked();
        }
    });
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    _backgroundImageView.image = _normalBackImage;
}
@end
