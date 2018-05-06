//
//  WaveView.h
//  DrumSolo2
//
//  Created by 尹岩岩 on 2017/9/25.
//  Copyright © 2017年 shenleyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaveView : UIView
/// 进度 0~1
@property (nonatomic, assign) float   progress;
// 波形颜色
-(void)setWave1Color:(UIColor *) color1 Wave2Color:(UIColor *) color2 Wave3Color:(UIColor *) color3;
@end
