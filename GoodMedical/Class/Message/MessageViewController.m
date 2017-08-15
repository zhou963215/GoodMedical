//
//  MessageViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/7/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageHelp.h"
@interface MessageViewController ()

@property (nonatomic, strong) UISegmentedControl * segmentedControl;
@property (nonatomic, strong) MessageHelp * messageHelp;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"消息";
    [self headerView];
    [self addMessageHelp];
}


- (void)headerView{
   
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 51)];
    bgView.backgroundColor = RGB(237, 237, 237);
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
    view.backgroundColor = [UIColor whiteColor];
    _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"消息",@"动态"]];
    [_segmentedControl setWidth:150];
    _segmentedControl.tintColor = [UIColor orangeColor];
    _segmentedControl.selectedSegmentIndex = 0;
    _segmentedControl.center = view.center;
    [view addSubview:_segmentedControl];
    [bgView addSubview:view];
    [_segmentedControl addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:bgView];
   
}

- (void)segClick:(UISegmentedControl *)seg{
    
   
    
    
    
}

- (void)addMessageHelp{
    
    _messageHelp = [MessageHelp blog];
    [self.view addSubview:_messageHelp.tableView];
    
    WEAKSELF(wk);
    
    [_messageHelp.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(wk.view);
        make.top.equalTo(wk.view).offset(51);
        make.bottom.equalTo(wk.view).offset(-49);
    }];
    
    
    
    
}


@end
