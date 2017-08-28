//
//  AppointmentSVC.m
//  GoodMedical
//
//  Created by zhou on 2017/8/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AppointmentSVC.h"

#import "AppointmentSHelper.h"
@interface AppointmentSVC ()

@property (nonatomic, strong) AppointmentSHelper * detailhelper;
@end

@implementation AppointmentSVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"平台下单";
    [self addHelper];
    
}


- (void)addHelper{
    
    _detailhelper = [AppointmentSHelper blog];
    [self.view addSubview:_detailhelper.tableView];
    WEAKSELF(wk)
    [_detailhelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.left.right.equalTo(wk.view);
        
    }];
    
    
    
}


@end
