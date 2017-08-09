//
//  PlatformDetailViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/8/2.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "PlatformDetailViewController.h"
#import "PlatformDetailHelper.h"
@interface PlatformDetailViewController ()

@property (nonatomic, strong) PlatformDetailHelper * detailhelper;
@end

@implementation PlatformDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.navigationItem.title = @"平台预约";
    [self addHelper];
    
}


- (void)addHelper{
    
    _detailhelper = [PlatformDetailHelper blog];
    [self.view addSubview:_detailhelper.tableView];
    WEAKSELF(wk)
    [_detailhelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.left.right.equalTo(wk.view);
    
    }];
    
    
    
}


@end
