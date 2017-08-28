//
//  ChannelCertificationVC.m
//  GoodMedical
//
//  Created by zhou on 2017/8/15.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ChannelCertificationVC.h"
#import "TopCertificationView.h"
#import "DoctorCardHelper.h"
#import "ChannelNameHelper.h"
#import "ChannelMerchantsHelper.h"
@interface ChannelCertificationVC ()

@property (nonatomic, strong) TopCertificationView * topView;

@property (nonatomic, strong) ChannelNameHelper * nameHelper;
@property (nonatomic, strong) ChannelMerchantsHelper * merchantsHelper;
@property (nonatomic, strong) DoctorCardHelper * cardHelper;

@property (nonatomic, strong) UIScrollView * scrollView;

@end

@implementation ChannelCertificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"渠道入驻";
    [self setSubViews];
    
    
}

- (void)setSubViews{
    
    _topView = [[TopCertificationView alloc]initWithFrame:CGRectMake(0, 10, WIDTH, 60) Titles:[NSArray arrayWithObjects:@"基本信息", @"证件照片", @"结算信息", nil]];
    [self.view addSubview:_topView];
    
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.contentSize = CGSizeMake(WIDTH*3, 0);
    _scrollView.scrollEnabled = NO;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor orangeColor];
    WEAKSELF(wk);
    
    
    _nameHelper = [ChannelNameHelper blog];
    _nameHelper.nextStep = ^(NSInteger count) {
        
        [wk scrollNextWithCount:count];
        
    };
    [self.scrollView addSubview:_nameHelper.tableView];
    
    _merchantsHelper = [ChannelMerchantsHelper blog];
    _merchantsHelper.nextStep = ^(NSInteger count) {
        
        [wk scrollNextWithCount:count];
        
    };
    [self.scrollView addSubview:_merchantsHelper.tableView];

    _cardHelper = [DoctorCardHelper blog];
    _cardHelper.nextStep = ^(NSInteger count) {
        
        [wk submit];
        
    };
    [self.scrollView addSubview:_cardHelper.tableView];
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(wk.view);
        make.top.equalTo(wk.topView.mas_bottom);
        
    }];

    
    [_nameHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.width.top.equalTo(self.scrollView);
        make.bottom.equalTo(wk.view);
    }];
    
    [_merchantsHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.top.equalTo(wk.scrollView);
        make.left.equalTo(wk.nameHelper.tableView.mas_right);
        make.bottom.equalTo(wk.view);
        
    }];
    
   
    
    [_cardHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.top.equalTo(wk.scrollView);
        make.left.equalTo(wk.merchantsHelper.tableView.mas_right);
        make.bottom.equalTo(wk.view);
        
    }];
    
}

- (void)scrollNextWithCount:(NSInteger)count{
    
    [self.topView setStepIndex:(int )count Animation:YES];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.scrollView setContentOffset:CGPointMake(WIDTH*count, 0)];
        
    }];
    
    
    
}

- (void)submit{
    
    
    [self backLastView];
}

- (void)backLastView{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



@end
