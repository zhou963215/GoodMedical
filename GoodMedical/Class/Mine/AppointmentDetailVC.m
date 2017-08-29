//
//  AppointmentDetailVC.m
//  GoodMedical
//
//  Created by zhou on 2017/8/29.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AppointmentDetailVC.h"
#import "AppointmentHelper.h"

@interface AppointmentDetailVC ()

@property (nonatomic, strong) AppointmentHelper * appointmentHelper;

@end

@implementation AppointmentDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"预约详情";
    [self setSubviews];
    

}


- (void)setSubviews{
    
    
    _appointmentHelper = [AppointmentHelper blog];
    [self.view addSubview:_appointmentHelper.tableView];
    
    WEAKSELF(wk);
    
    [_appointmentHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(wk.view);
    }];
    
    
    
}

@end
