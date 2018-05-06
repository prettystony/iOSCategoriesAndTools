//
//  TouchEnlargeButton.h
//  DrumSolo2
//
//  Created by ZHANGYONG on 2018/2/11.
//  Copyright © 2018年 shenleyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchEnlargeButton : UIButton
{
    float _touchEnlargeScale;
}

- (void)setTouchEnlargeScale:(float)scale;

@end
