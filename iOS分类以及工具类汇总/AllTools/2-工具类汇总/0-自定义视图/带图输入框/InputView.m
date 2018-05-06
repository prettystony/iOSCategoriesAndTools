//
//  InputView.m
//  SP2P_9
//
//  Created by md005 on 16/3/26.
//  Copyright © 2016年 EIMS. All rights reserved.
//

#import "InputView.h"
#import "UIColor+HEX.h"
#import "Masonry.h"
@interface InputView()
@property (nonatomic,strong) UIView *superView;

@end

@implementation InputView

- (id)initWithImgName:(NSString *)imgName WithSelectImgName:(NSString *)selectImgName placeContent:(NSString *)content{
	if (self = [super init]) {
		
		_superView = self;
        self.backgroundColor = [UIColor whiteColor];
        
        if (imgName.length > 0) {
            
            // 左边的图片
            //		_leftImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgName] highlightedImage:[UIImage imageNamed:selectImgName]];
            _leftImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
            [self addSubview:_leftImg];
            [_leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
                //            make.top.equalTo(_superView.mas_top).with.offset(5);
                make.left.equalTo(_superView.mas_left).with.offset(0);
                make.size.mas_equalTo(CGSizeMake(16 ,16));
                make.centerY.equalTo(_superView.mas_centerY);
            }];
        }
		
		// 中间的输入框
		_inputField = [[UITextField alloc]init];
		_inputField.placeholder = content;
		_inputField.keyboardType = UIKeyboardTypeNumberPad;
		[_inputField setFont:[UIFont fontWithName:@"STHeitiSC-Medium" size:14.0]];
		_inputField.clearButtonMode = UITextFieldViewModeWhileEditing;
		[self addSubview:_inputField];
        
        
        if (imgName.length > 0){
            
            [_inputField mas_makeConstraints:^(MASConstraintMaker *make) {
                //            make.top.equalTo(_superView.mas_top).with.offset(5);
                make.left.equalTo(_leftImg.mas_right).with.offset(12);
                make.right.equalTo(_superView.mas_right).with.offset(-15);
                make.centerY.equalTo(_superView.mas_centerY);
                make.height.mas_equalTo(35);
            }];
        }else {
            
            [_inputField mas_makeConstraints:^(MASConstraintMaker *make) {
                //            make.top.equalTo(_superView.mas_top).with.offset(5);
                make.left.equalTo(_superView.mas_left).with.offset(12);
                make.right.equalTo(_superView.mas_right).with.offset(-15);
                make.centerY.equalTo(_superView.mas_centerY);
                make.height.mas_equalTo(35);
            }];
        }

		
		// 底部线条
		UILabel *lineLabel = [[UILabel alloc]init];
		lineLabel.backgroundColor = [UIColor colorWithHexString:@"0Xdedede"];
		[self addSubview:lineLabel];
        [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_superView.mas_left).with.offset(0);
            make.right.equalTo(_superView.mas_right).with.offset(-15);
            make.bottom.equalTo(_superView.mas_bottom).with.offset(1);
            make.height.mas_equalTo(0.5);
        }];
	}
	return self;
}

@end
