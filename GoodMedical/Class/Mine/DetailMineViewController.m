//
//  DetailMineViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/8/23.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "DetailMineViewController.h"
#import "DetailMineHelper.h"
@interface DetailMineViewController ()

@property (nonatomic, strong) DetailMineHelper * mineHelper;

@end

@implementation DetailMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"修改资料";
    [self addHelper];

}

- (void)addHelper{
    
    _mineHelper = [DetailMineHelper blog];
    [self.view addSubview:_mineHelper.tableView];
    
    WEAKSELF(wk);
    
    [_mineHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.bottom.equalTo(wk.view);
        
    }];
    
    
    
}

@end
