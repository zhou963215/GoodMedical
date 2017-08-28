//
//  CertificationSelectVC.m
//  GoodMedical
//
//  Created by zhou on 2017/8/15.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "CertificationSelectVC.h"
#import "DoctorCertificationVC.h"
#import "ChannelCertificationVC.h"
#import "ChannelCertificationVC.h"
@interface CertificationSelectVC ()

@end

@implementation CertificationSelectVC

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = @"认证";

    [self creatSubviews];
}



- (void)creatSubviews{
    
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundColor:[UIColor orangeColor]];
    [button1 setTitle:@"医生认证" forState:UIControlStateNormal];
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 50;
    button1.tag = 1;
    [self.view addSubview:button1];
    
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setBackgroundColor:[UIColor cyanColor]];
    [button2 setTitle:@"渠道认证" forState:UIControlStateNormal];
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 50;
    button2.tag = 2;
    [self.view addSubview:button2];
    
    [button1 addTarget:self action:@selector(nextStep:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(nextStep:) forControlEvents:UIControlEventTouchUpInside];

    WEAKSELF(wk);
    
    
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk.view).offset(30);
        make.top.equalTo(wk.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
    }];
    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.width.height.equalTo(button1);
        make.right.equalTo(wk.view).offset(-30);
    }];
    
    
    
}

- (void)nextStep:(UIButton *)sender{
    
    
    if (sender.tag ==1) {
      //医生认证
        [self.navigationController pushViewController:[DoctorCertificationVC new] animated:YES];
        
    }else{
        
       //渠道认证
        [self.navigationController pushViewController:[ChannelCertificationVC new] animated:YES];
        
    }
    
}
@end
