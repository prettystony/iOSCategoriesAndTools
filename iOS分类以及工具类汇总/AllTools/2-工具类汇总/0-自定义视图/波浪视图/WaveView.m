//
//  WaveView.m
//  DrumSolo2
//
//  Created by 尹岩岩 on 2017/9/25.
//  Copyright © 2017年 shenleyang. All rights reserved.
//

#import "WaveView.h"
static CGFloat cycle = 1.0;//循环次数
static CGFloat waveMoveSpan = 5.0;//波浪移动单位跨度
static CGFloat animationUnitTime = 0.02;//重画单位时间
CGFloat term = 0.0;  //周期（在代码中重新计算）
CGFloat phasePosition = 0.0; //相位必须为0(画曲线机制局限)
CGFloat amplitude = 50.0;//波幅
CGFloat position = 40.0;//X轴所在的Y坐标（在代码中重新计算(即水深度)
BOOL waving = YES;
@interface WaveView()
@property (nonatomic, assign) CGFloat originX; //X坐标起点
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) CGFloat tempOriginX;
@end
@implementation WaveView
{
    UIColor *_waveColor1;
    UIColor *_waveColor2;
    UIColor *_waveColor3;
    NSTimer *_timer;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       // [self animationWaterWave];
        self.originX = 0;
        self.progress = 0.5;
       _tempOriginX =  self.originX;
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink)];

        // 每隔1帧调用一次
        self.displayLink.preferredFramesPerSecond = 60;

        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}
-(void)handleDisplayLink
{
        if (self.originX <= _tempOriginX - term)
        {
            self.originX = _tempOriginX - waveMoveSpan;
        } else
        {
            self.originX -= waveMoveSpan;
        }
    [self setNeedsDisplay];
}
- (void)animationWaterWave
{
    self.originX = 0;
    self.progress = 0.5;
    waving = YES;

    __weak typeof(self) weakself = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{

        CGFloat tempOriginX =  weakself.originX;

        while (waving) {

            if (weakself.originX <= tempOriginX - term)
            {
                weakself.originX = tempOriginX - waveMoveSpan;
            } else
            {
                weakself.originX -= waveMoveSpan;
            }

            dispatch_async(dispatch_get_main_queue(), ^{
                [weakself setNeedsDisplay];
            });

            [NSThread sleepForTimeInterval:animationUnitTime];
        }
    });
    
//    _timer = [NSTimer timerWithTimeInterval:0.04 repeats:YES block:^(NSTimer * _Nonnull timer) {
//
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
////            MedeliLog(@"%@", [NSThread currentThread]);
//                if (self.originX <= tempOriginX - term)
//                {
//                    self.originX = tempOriginX - waveMoveSpan;
//                } else
//                {
//                    self.originX -= waveMoveSpan;
//                }
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [self setNeedsDisplay];
//                });
//        });
//    }];
//    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    term = self.bounds.size.width / cycle;
    
    self.backgroundColor = [UIColor clearColor];
}
-(void)setWave1Color:(UIColor *) color1 Wave2Color:(UIColor *) color2 Wave3Color:(UIColor *) color3
{
    _waveColor1 = color1;
    _waveColor2 = color2;
    _waveColor3 = color3;
}
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    position = (1 - self.progress) * self.bounds.size.height;
    
    [self drawWaveWaterWithOriginX:self.originX - term / 5 fillColor:_waveColor1];
    
    [self drawWaveWaterWithOriginX:self.originX - term / 10 fillColor:_waveColor2];
    
    [self drawWaveWaterWithOriginX:self.originX fillColor:_waveColor3];
    
    
}
/**  （循环画波浪）
 *  画水波
 *
 @param originX 起始位置
 @param fillColor 填充色
 */
- (void)drawWaveWaterWithOriginX:(double)originX fillColor:(UIColor *)fillColor
{
    UIBezierPath *curvePath = [UIBezierPath bezierPath];
    
    [curvePath moveToPoint:CGPointMake(originX, position)];
    
    CGFloat tempPoint = originX;
    
    // (2 * cycle)即可充满屏幕，即一个循环,为了移动画布使波浪移动，我们要画2个循环
    int tempValue = [self roundingWithCount:(3 * cycle) * 2];
    
    for (int i = 0; i < tempValue; i++) {
        
        // 二次贝塞尔曲线
        [curvePath addQuadCurveToPoint:[self keyPointWith:tempPoint + term / 2 originX:originX]
                          controlPoint:[self keyPointWith:tempPoint + term / 4 originX:originX]];
        
        tempPoint += term / 2;
    }
    
    // 关闭路径
    [curvePath addLineToPoint:CGPointMake(curvePath.currentPoint.x, self.bounds.size.height)];
    [curvePath addLineToPoint:CGPointMake((CGFloat)originX, self.bounds.size.height)];
    
    [curvePath closePath];
    
    [fillColor setFill];
    curvePath.lineWidth = 10;

    [curvePath fill];
}
- (CGPoint)keyPointWith:(double)viewX originX:(double)originX
{
    return CGPointMake(viewX, [self columnYPoint:viewX - originX]);
}
- (double)columnYPoint:(double)viewX
{
    //三角正弦函数
    double result = amplitude * sin((2 * M_PI / term) * viewX + phasePosition);
    
    return result + position;
}
//四舍五入
- (int)roundingWithCount:(CGFloat)value
{
    int tempInt = (int)value;
    
    CGFloat tempDouble = tempInt + 0.5;
    
    if( value > tempDouble )
    {
        return tempInt + 1;
        
    } else {
        return tempInt;
    }
    
}
- (void)removeFromSuperview
{
    [super removeFromSuperview];

    waving = NO;
    
//    [_timer invalidate];
}
@end
