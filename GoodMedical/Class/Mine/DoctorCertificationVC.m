//
//  DoctorCertificationVC.m
//  GoodMedical
//
//  Created by zhou on 2017/8/15.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "DoctorCertificationVC.h"
#import "TopCertificationView.h"
#import "DoctorHelper.h"
#import "DoctorPhotoHelp.h"
#import "InProjectHelper.h"
#import "TotalPriceModel.h"
#import "DoctorCardHelper.h"
@interface DoctorCertificationVC ()

@property (nonatomic, strong) TopCertificationView * topView;
@property (nonatomic, strong) DoctorHelper * doctor;
@property (nonatomic, strong) DoctorPhotoHelp * photo;
@property (nonatomic, strong) InProjectHelper * inHelper;
@property (nonatomic, strong) DoctorCardHelper * cardHelper;

@property (nonatomic, strong) UIScrollView * scrollView;

@end

@implementation DoctorCertificationVC



- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = @"医生入驻";
    [self setSubViews];
    
       
}

- (void)setSubViews{
    
    _topView = [[TopCertificationView alloc]initWithFrame:CGRectMake(0, 10, WIDTH, 60) Titles:[NSArray arrayWithObjects:@"基本信息", @"证件照片", @"入住项目", @"结算信息", nil]];
    [self.view addSubview:_topView];
    
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.contentSize = CGSizeMake(WIDTH*4, 0);
    _scrollView.scrollEnabled = NO;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor orangeColor];
    WEAKSELF(wk);

    
    _doctor = [DoctorHelper blog];
    _doctor.nextStep = ^(NSInteger count) {
      
        [wk scrollNextWithCount:count];
        
    };
    [self.scrollView addSubview:_doctor.tableView];
    
    _photo = [DoctorPhotoHelp blog];
    _photo.nextStep = ^(NSInteger count) {
      
        [wk scrollNextWithCount:count];

    };
    [self.scrollView addSubview:_photo.tableView];
    
    _inHelper = [InProjectHelper blog];
    _inHelper.nextStep = ^(NSInteger count) {
        
        [wk scrollNextWithCount:count];

    };
    [self.scrollView addSubview:_inHelper.tableView];
    
    _cardHelper = [DoctorCardHelper blog];
    _cardHelper.nextStep = ^(NSInteger count) {
        
        [wk submit];
        
    };
    [self.scrollView addSubview:_cardHelper.tableView];
    
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(wk.view);
        make.top.equalTo(wk.topView.mas_bottom);
        
    }];

    
    [_doctor.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.width.top.equalTo(self.scrollView);
        make.bottom.equalTo(wk.view);
    }];
    
    [_photo.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.top.equalTo(wk.scrollView);
        make.left.equalTo(wk.doctor.tableView.mas_right);
        make.bottom.equalTo(wk.view);
        
    }];
    
    [_inHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.top.equalTo(wk.scrollView);
        make.left.equalTo(wk.photo.tableView.mas_right);
        make.bottom.equalTo(wk.view);

    }];
    
    [_cardHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.top.equalTo(wk.scrollView);
        make.left.equalTo(wk.inHelper.tableView.mas_right);
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
    
    [[TotalPriceModel dataModel]reductionZero];
    [self.navigationController popViewControllerAnimated:YES];
    
}



@end
