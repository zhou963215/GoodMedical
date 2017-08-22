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
        make.bottom.equalTo(wk.view).offset(-60);
        
    }];

    
    
    UIView * backgroundView = [[UIView alloc]init];
    backgroundView.backgroundColor = GAYCOLOR;
    [self.view addSubview:backgroundView];
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:[UIColor cyanColor]];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5 ;
    [button setTitle:@"提交" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextstep:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(wk.view);
        make.top.equalTo(wk.afertHelper.tableView.mas_bottom);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(backgroundView);
        make.size.mas_equalTo(CGSizeMake(WIDTH*0.7, 40));
    }];
    

    
    
}


- (void)nextstep:(UIButton *)sender{
    
    
    NSLog(@"%@",_afertHelper.casesData);
    
    
    
}

@end
