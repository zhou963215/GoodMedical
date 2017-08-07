//
//  BasePopView.m
//  GoodMedical
//
//  Created by zhou on 2017/7/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "BasePopView.h"
#import "LeftHelper.h"
#import "ClassificationHelper.h"
@interface BasePopView ()
{
    
    CGFloat topHeight;
    
    
    
}

@property(nonatomic, strong) UIView * bGView;
@property(nonatomic, strong) UIButton * canceButton;
@property(nonatomic, strong) UIButton * submitButton;


@end

@implementation BasePopView



+(instancetype)sharePop:(CGFloat)height{
    
    
    return [[BasePopView alloc]initAlertViewHeight:height];
}

-(instancetype)initAlertViewHeight:(CGFloat)height{
    
    self=[super init];
    if (self) {
        
        topHeight = height;
        self.dataArray = [NSMutableArray array];
        
        [self addSubview:self.bGView];
        [self addSubview:self.popView];
        [self.popView addSubview:self.totolBar];
        [self setTotalBarSubviews];
        self.frame = CGRectMake(0,0,WIDTH,HEIGHT);
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
        
        [self show:YES];
        [self setSubviews];

        
    }
    return self;
}


- (void)setSubviews{
    
       
    
   
    
    
    
    
}

- (void)setTotalBarSubviews{
    
    _canceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_canceButton setTitle:@"取消" forState:UIControlStateNormal];
    _canceButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_canceButton setTitleColor:UICOLORRGB(0x35ace1) forState:UIControlStateNormal];
    [_canceButton addTarget:self action:@selector(clickBgViewToHide) forControlEvents:UIControlEventTouchUpInside];
    [_totolBar addSubview:_canceButton];
    
    _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_submitButton setTitle:@"确定" forState:UIControlStateNormal];
    _submitButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_submitButton setTitleColor:UICOLORRGB(0x35ace1) forState:UIControlStateNormal];
    [_submitButton addTarget:self action:@selector(submitData) forControlEvents:UIControlEventTouchUpInside];
    
    [_totolBar addSubview:_submitButton];

    UIView * line = [UIView new];
    line.backgroundColor = [UIColor lightGrayColor];
    [_totolBar addSubview:line];
    
    
    WEAKSELF(wk);
    
    [_canceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(wk.totolBar).offset(10);
        make.bottom.equalTo(wk.totolBar).offset(-10);
        make.width.mas_equalTo(@40);
        
        
    }];
    
    
    [_submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wk.totolBar).offset(10);
        make.bottom.right.equalTo(wk.totolBar).offset(-10);
        make.width.mas_equalTo(@40);
        
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(wk.totolBar);
        make.height.mas_equalTo(@1);
        
    }];
    
}


- (void)submitData{
    
    
    
}



- (void)show:(BOOL)animated
{
    if (animated)
    {
        CGFloat top_y = HEIGHT-topHeight;
        
        
        [UIView animateWithDuration:.3 animations:^{
            
            self.popView.frame = CGRectMake(0, top_y, WIDTH, topHeight);
            
        } completion:^(BOOL finished) {

        }];
    }
}

- (void)clickBgViewToHide{
    
    [self hide:YES];
    
}
- (void)hide:(BOOL)animated
{
    [self endEditing:YES];
    
    if (self.bGView != nil) {
        
        [UIView animateWithDuration:animated ?0.3: 0 animations:^{
            
            self.popView.frame = CGRectMake(0, HEIGHT, WIDTH, topHeight);
            
        } completion:^(BOOL finished) {
            
//            [self.bGView removeFromSuperview];
            [self removeFromSuperview];
//            self.bGView=nil;

        }];
    }
    
}



#pragma CREAT


- (UIView *)bGView{
    
    if (!_bGView) {
        
        _bGView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _bGView.backgroundColor = [UIColor blackColor];
        _bGView.alpha = 0.4 ;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBgViewToHide)];
        [_bGView addGestureRecognizer:tap];
    }
    
    
    return _bGView;
}

- (UIView *)popView{
    
    if (!_popView) {
        
        _popView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-44, WIDTH, topHeight-44)];
        _popView.backgroundColor = [UIColor whiteColor];
        
    }
    
    
    return _popView;
}

- (UIView *)totolBar{
    
    if (!_totolBar) {
        
        _totolBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 44)];
        _totolBar.backgroundColor = [UIColor whiteColor];
    }
    
    
    return _totolBar;
}








@end
