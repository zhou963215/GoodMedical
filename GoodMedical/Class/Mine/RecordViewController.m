//
//  RecordViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/9/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "RecordViewController.h"
#import "RecordHelper.h"
@interface RecordViewController ()
@property (nonatomic, strong) RecordHelper * recordHelper;
@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"修改绑定手机号码";
    [self setSubviews];
    
}

- (void)setSubviews{
    
    
    _recordHelper = [RecordHelper blog];
    [self.view addSubview:_recordHelper.tableView];
    
    WEAKSELF(wk);
    
    [_recordHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(wk.view);
    }];
    
    
    
}


@end
