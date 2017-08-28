//
//  TopUpViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/8/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "TopUpViewController.h"
#import "TopUpHelper.h"
@interface TopUpViewController ()

@property (nonatomic, strong) TopUpHelper * topUp;
@end

@implementation TopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLORRGB(0xf5f5f5);
    self.title = @"账户充值";
    
    [self addTopUP];


}

- (void)addTopUP{
    
    _topUp = [TopUpHelper blog];
    [self.view addSubview:_topUp.tableView];
    
    WEAKSELF(wk);
    
    [_topUp.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.bottom.equalTo(wk.view);

    }];
    
    
    
}
@end
