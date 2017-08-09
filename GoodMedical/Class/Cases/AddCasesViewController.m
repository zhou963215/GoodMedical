//
//  AddCasesViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/8/5.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AddCasesViewController.h"
#import "AddCasesHelper.h"
@interface AddCasesViewController ()

@property (nonatomic, strong) AddCasesHelper * addCases;
@end

@implementation AddCasesViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"病历信息";
    
    [self addCase];
    
    


}

- (void)addCase{
    
    _addCases = [AddCasesHelper blog];
    [self.view addSubview:_addCases.tableView];
    
    WEAKSELF(wk);
    [_addCases.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.equalTo(wk.view);
        make.bottom.equalTo(wk.view).offset(-40);
        
    }];
    
    
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:[UIColor cyanColor]];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(savestep:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(wk.view);
        make.top.equalTo(wk.addCases.tableView.mas_bottom);
        
    }];
    
    
}

- (void)savestep:(UIButton *)sender{
    
    
    NSMutableDictionary * caseDict = [_addCases.casesDict mutableCopy];
    
    NSArray * keys = caseDict.allKeys;
    
    for (NSString * key in keys) {
        
        NSString * str = caseDict[key];
        
        if ([str isEqualToString:@""]) {
            
            if ([key isEqualToString:@"name"]) {
                
                [ZHHud initWithMessage:@"请输入姓名"];
                return;
            }
            
            
            
        }
        
        
    }
    
    
    NSLog(@"%@",_addCases.casesDict);
    
    
    
}

@end
