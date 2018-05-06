//
//  WaveButton.h
//  testWaveButton
//
//  Created by 尹岩岩 on 2017/8/22.
//  Copyright © 2017年 尹岩岩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaveButton : UIView
@property (assign, nonatomic) BOOL isEnable;
@property (strong, nonatomic) UIColor* backColor;
@property (strong, nonatomic) UIColor* waveClolr;
@property (strong, nonatomic) void(^btnTouchesBegan)();
@property (strong, nonatomic) void(^btnClicked)();

-(void) setTitle:(NSString *)title withColor:(UIColor*)color andFont:(UIFont*)font;
-(void) setNormalBackImage:(UIImage *)normalImage andHighlightImage:(UIImage *)highlightImage;
@end
