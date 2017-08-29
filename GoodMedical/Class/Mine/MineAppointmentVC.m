//
//  MineAppointmentVC.m
//  GoodMedical
//
//  Created by zhou on 2017/8/29.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MineAppointmentVC.h"
#import "MineAppointmentHelper.h"
@interface MineAppointmentVC ()

@property (nonatomic, strong) MineAppointmentHelper * mineAppointment;

@end

@implementation MineAppointmentVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我的预约";
    
    [self setSubviews];

}

- (void)setSubviews{
    
    
    _mineAppointment = [MineAppointmentHelper blog];
    [self.view addSubview:_mineAppointment.tableView];
    
    WEAKSELF(wk);
    
    [_mineAppointment.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(wk.view);
    }];
    
    
    
}



@end
