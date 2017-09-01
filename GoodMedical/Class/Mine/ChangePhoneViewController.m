//
//  ChangePhoneViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/9/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ChangePhoneViewController.h"
#import "ChangePhoneHelper.h"
@interface ChangePhoneViewController ()

@property (nonatomic, strong) ChangePhoneHelper * phoneHelper;
@end

@implementation ChangePhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.title = @"修改绑定手机号码";
    [self setSubviews];
    
}

- (void)setSubviews{
    
    
    _phoneHelper = [ChangePhoneHelper blog];
    [self.view addSubview:_phoneHelper.tableView];
    
    WEAKSELF(wk);
    
    [_phoneHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(wk.view);
    }];
    
    
    
}






@end
