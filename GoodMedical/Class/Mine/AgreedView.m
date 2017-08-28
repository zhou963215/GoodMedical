//
//  AgreedView.m
//  GoodMedical
//
//  Created by zhou on 2017/8/22.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AgreedView.h"

@interface AgreedView ()



@end



@implementation AgreedView


- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        [self setSubviews];
        
    }
    
    return self;
}


- (void)setSubviews{
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"a_nselect"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"a_select"] forState:UIControlStateSelected];
    leftBtn.selected = YES;
    _isAgreed = leftBtn.selected;
    [leftBtn addTarget:self action:@selector(agreed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    
    UILabel * label = [UILabel new];
    label.font = [UIFont systemFontOfSize:12];
    label.text = @"阅读并接受";
    label.textColor = [UIColor grayColor];
    [self addSubview:label];
    
    
    UILabel * agreed = [UILabel new];
    agreed.userInteractionEnabled = YES;
    agreed.textColor = [UIColor blueColor];
    agreed.text = @"<<入驻服务协议>>";
    agreed.font = [UIFont systemFontOfSize:12];
    [self addSubview:agreed];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapLabel:)];
    tap.numberOfTapsRequired=1;//单击
    tap.numberOfTouchesRequired=1;//单点触碰
    [agreed addGestureRecognizer:tap];
    WEAKSELF(wk);
    
    
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk).offset(20);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(wk);
        
        
    }];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(leftBtn.mas_right).offset(2);
        make.centerY.equalTo(wk);
    }];
    
    [agreed mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(label.mas_right);
        make.centerY.equalTo(wk);
    }];
    
    
}


- (void)agreed:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
    _isAgreed = sender.selected;
    
}
- (void)tapLabel:(id)tap{
    
    NSLog(@"单休的我完全恢复不过来");
    
}

@end
