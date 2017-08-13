//
//  CasesAfterViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/8/11.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "CasesAfterViewController.h"
#import "CasesAfterHelper.h"


@interface CasesAfterViewController ()

@property (nonatomic, strong) CasesAfterHelper * afertHelper;
@end

@implementation CasesAfterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"添加病程";
    [self addAfterHelper];
    
    
}

- (void)addAfterHelper{
    
    _afertHelper = [CasesAfterHelper blog];
    [self.view addSubview:_afertHelper.tableView];
    WEAKSELF(wk);
    [_afertHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.equalTo(wk.view);
        make.bottom.equalTo(wk.view).offset(-40);
        
    }];

    
    
    
}

@end
