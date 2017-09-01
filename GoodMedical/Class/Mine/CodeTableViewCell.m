//
//  CodeTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/9/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "CodeTableViewCell.h"

@interface CodeTableViewCell ()<UITextFieldDelegate>


@property (nonatomic, strong) UITextField * codeTextField;

@end

@implementation CodeTableViewCell



- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setSubViews];
    }
    
    return self;
}


- (void)setSubViews{
    
    UILabel * leftTitle = [UILabel new];
    leftTitle.font = [UIFont systemFontOfSize:14];
    leftTitle.text = @"验证码";
    leftTitle.textColor = UICOLORRGB(0x777777);
    [self addSubview:leftTitle];
    
    
    _codeTextField = [UITextField new];
    _codeTextField.font = [UIFont systemFontOfSize:14];
    _codeTextField.keyboardType = UIKeyboardTypeNumberPad;
    _codeTextField.placeholder = @"请输入验证码";
    _codeTextField.delegate = self;
    [self addSubview:_codeTextField];
    
    _codeBtn = [CountdownBtn countdownButton];
    _codeBtn.title = @"获取验证码";
    _codeBtn.titleLabelFont = [UIFont systemFontOfSize:14];
    _codeBtn.nomalBackgroundColor = UICOLORRGB(0x3EA0E6);
    _codeBtn.disabledBackgroundColor = UICOLORRGB(0xb4b4b4);
    _codeBtn.totalSecond = 60;
    [self addSubview:_codeBtn];
    [_codeBtn processBlock:^(NSUInteger second) {
        
        _codeBtn.title = [NSString stringWithFormat:@"%lis", second] ;
    } onFinishedBlock:^{  // 倒计时完毕
        _codeBtn.title = @"获取验证码";
    }];
    WEAKSELF(wk);
    
    [leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk).offset(20);
        make.centerY.equalTo(wk);
        make.width.mas_equalTo(@100);
    }];
    
    [_codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(leftTitle.mas_right).offset(20);
        make.right.equalTo(wk.codeBtn.mas_left).offset(-20);
        make.centerY.equalTo(wk);
        
    }];
    
    [_codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(wk).offset(-20);
        make.centerY.equalTo(wk);
        make.size.mas_equalTo(CGSizeMake(90, 30));
        
    }];

    
    
}



@end
