//
//  TopDownViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/8/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "TopDownViewController.h"
#import "TopDownHelper.h"
@interface TopDownViewController ()

@property (nonatomic, strong) TopDownHelper * topUp;

@end

@implementation TopDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UICOLORRGB(0xf5f5f5);
    self.title = @"微信提现";
    
    [self addTopUP];
    
    
}

- (void)addTopUP{
    
    _topUp = [TopDownHelper blog];
    [self.view addSubview:_topUp.tableView];
    
    WEAKSELF(wk);
    
    [_topUp.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.bottom.equalTo(wk.view);
        
    }];
    
    
    
}


@end
