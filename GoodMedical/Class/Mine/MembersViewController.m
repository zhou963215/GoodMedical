//
//  MembersViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/8/30.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MembersViewController.h"
#import "MembersHelper.h"
@interface MembersViewController ()

@property (nonatomic, strong) MembersHelper * members;

@end

@implementation MembersViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"会员中心";
    [self setSubviews];
    
}

- (void)setSubviews{
    
    
    _members = [MembersHelper blog];
    [self.view addSubview:_members.tableView];
    
    WEAKSELF(wk);
    
    [_members.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(wk.view);
    }];
    
    
    
}


@end
