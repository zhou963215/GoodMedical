//
//  PayDetailViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/8/5.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "PayDetailViewController.h"
#import "PayDetailHelper.h"
@interface PayDetailViewController ()

@property (nonatomic, strong) PayDetailHelper * payDetail;

@end

@implementation PayDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"预约订单支付";
    [self addHelper];



}
- (void)addHelper{
    
    _payDetail = [PayDetailHelper blog];
    [self.view addSubview:_payDetail.tableView];
    
    WEAKSELF(wk);
    
    [_payDetail.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(wk.view);
    }];
    
    
    
}


@end
