//
//  MineOrderViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/8/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MineOrderViewController.h"
#import "MineOrderHelper.h"
@interface MineOrderViewController ()

@property (nonatomic, strong) MineOrderHelper * orderHelper;
@end

@implementation MineOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = @"我的预约订单";
    [self setSubviews];
    
}


- (void)setSubviews{
    
    
    _orderHelper = [MineOrderHelper blog];
    [self.view addSubview:_orderHelper.tableView];
    
    WEAKSELF(wk);
    
    [_orderHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(wk.view);
    }];
    
    
    
}


@end
