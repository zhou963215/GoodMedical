//
//  CasesViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/7/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "CasesViewController.h"
#import "CasesHelper.h"
#import "AddCasesViewController.h"
@interface CasesViewController ()

@property (nonatomic, strong) CasesHelper * casesHleper;
@end

@implementation CasesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"病历";
    [self addCasesHlep];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"添加" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.frame = CGRectMake(0, 0, 40, 50);
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:self action:@selector(addNewCases) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
}

- (void)addCasesHlep{
    
    _casesHleper = [CasesHelper blog];
    [self.view addSubview:_casesHleper.tableView];
    WEAKSELF(wk);
    
    
    if (self.navigationController.viewControllers.count>1) {
        
        [_casesHleper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.right.bottom.equalTo(wk.view);
            
        }];
        
    }else{
        
        [_casesHleper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.right.equalTo(wk.view);
            make.bottom.equalTo(wk.view).offset(-49);
            
        }];
        
    }
   
}
- (void)addNewCases{
    
    [self.navigationController pushViewController:[AddCasesViewController new] animated:YES];
    
}

@end
