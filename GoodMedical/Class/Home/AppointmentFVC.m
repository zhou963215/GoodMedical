//
//  AppointmentFVC.m
//  GoodMedical
//
//  Created by zhou on 2017/8/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AppointmentFVC.h"

#import "AppointmentFHelper.h"
#import "TotalPriceModel.h"
@interface AppointmentFVC ()

@property(nonatomic, strong) AppointmentFHelper * platforme;
@end

@implementation AppointmentFVC

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [[TotalPriceModel dataModel]backZero];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"平台下单";
    
    [self addHelper];
    
    
    
}

- (void)addHelper{
    
    _platforme = [AppointmentFHelper blog];
    [self.view addSubview:_platforme.tableView];
    WEAKSELF(wk)
    [_platforme.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.left.right.equalTo(wk.view);
        
    }];
    
}

- (void)backLastView{
    
    [super backLastView];
    
    [[TotalPriceModel dataModel]reductionZero];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

@end
