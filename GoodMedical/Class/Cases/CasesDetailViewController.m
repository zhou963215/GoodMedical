//
//  CasesDetailViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/8/8.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "CasesDetailViewController.h"
#import "CasesDetailHelper.h"
@interface CasesDetailViewController ()

@property (nonatomic ,strong) CasesDetailHelper * detailHelp;

@end

@implementation CasesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addCasesHlep];


}


- (void)addCasesHlep{
    
    _detailHelp = [CasesDetailHelper blog];
    [self.view addSubview:_detailHelp.tableView];
    
    WEAKSELF(wk);
    [_detailHelp.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.bottom.equalTo(wk.view);
        
    }];
    
    _detailHelp.dataArray = @[@{@"photo":@1},@{@"photo":@0},@{@"photo":@1},@{@"photo":@0},@{@"photo":@1}];

}
@end
