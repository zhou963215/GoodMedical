//
//  AccountCenterVC.m
//  GoodMedical
//
//  Created by zhou on 2017/8/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AccountCenterVC.h"
#import "AccountCenterHelper.h"
@interface AccountCenterVC ()

@property (nonatomic, strong)AccountCenterHelper * centerHelper;
@end

@implementation AccountCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"账户中心";
    [self addHelper];

}

- (void)addHelper{
    
    _centerHelper = [AccountCenterHelper blog];
    [self.view addSubview:_centerHelper.tableView];
    
    WEAKSELF(wk);
    
    [_centerHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.bottom.equalTo(wk.view);
        
    }];
    
    
    
}



@end
