//
//  AccountCenterHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AccountCenterHelper.h"
#import "MineTableViewCell.h"
#import "TopUpViewController.h"
#import "TopDownViewController.h"
#import "RecordViewController.h"
@interface AccountCenterHelper ()

@property (nonatomic, strong) NSArray * rows;
@property (nonatomic, strong) UILabel * balanceLB;
@property (nonatomic, strong) YYLabel * freezeLB;
@property (nonatomic, strong) UILabel * todayDividedLB;
@property (nonatomic, strong) UILabel * dividedLB;


@end

@implementation AccountCenterHelper



+(instancetype)blog{
    
    return [[AccountCenterHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.rowHeight = 44;
        [self.tableView registerNib:[UINib nibWithNibName:@"MineTableViewCell" bundle:nil] forCellReuseIdentifier:@"mine"];
        self.tableView.tableHeaderView = [self creatHeaderView];
        self.tableView.tableFooterView = [UIView new];
        [self refreshRows];
    }
    
    return self;
    
    
}


- (void)refreshRows{
    

    self.rows = @[@[@{@"name":@"账户充值",@"detail":@""},@{@"name":@"账户提现",@"detail":@""}],@[@{@"name":@"账单记录",@"detail":@""},@{@"name":@"分成明细",@"detail":@""},@{@"name":@"提现记录",@"detail":@""}]];
    
}

#pragma mark  tableview代理方法

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  
    return 15;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  self.rows.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray * arr = _rows[section];
    
    
    return arr.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSDictionary * dict = _rows[indexPath.section][indexPath.row];
    MineTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"mine"];
    [cell upDataWithDict:dict];
    
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary * dict = _rows[indexPath.section][indexPath.row];
    
    if ([dict[@"name"]isEqualToString:@"账户充值"]) {
        
            [self.tableView.navigationController pushViewController:[TopUpViewController new] animated:YES];

    } if ([dict[@"name"]isEqualToString:@"账户提现"]) {
        
        [self.tableView.navigationController pushViewController:[TopDownViewController new] animated:YES];

    }if ([dict[@"name"]isEqualToString:@"账单记录"]) {
        
        [self.tableView.navigationController pushViewController:[RecordViewController new] animated:YES];
        
    }
    
    
}

- (UIView *)creatHeaderView{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 180)];
    view.backgroundColor = [UIColor orangeColor];
    
    UILabel * titleLB = [UILabel new];
    titleLB.text = @"账户余额(元)";
    titleLB.textColor = [UIColor lightGrayColor];
    titleLB.font = [UIFont systemFontOfSize:12];
    [view addSubview:titleLB];
    
    
    _balanceLB = [UILabel new];
    _balanceLB.textColor = [UIColor whiteColor];
    _balanceLB.text = @"0.00";
    [view addSubview:_balanceLB];
    
    _freezeLB = [YYLabel new];
    _freezeLB.textColor = [UIColor whiteColor];
    _freezeLB.font = [UIFont systemFontOfSize:14];
    _freezeLB.numberOfLines = 0;
    [self freezeText:@"0.00"];
    
    [view addSubview:_freezeLB];
    
    
    UIView  * leftView = [UIView new];
//    leftView.backgroundColor = [UIColor clearColor];
//    leftView.alpha = 0.3;
    [view addSubview:leftView];
    
    UILabel * leftTitle = [UILabel new];
    leftTitle.text = @"今日分成(元)";
    leftTitle.textColor = [UIColor lightGrayColor];
    leftTitle.font  = [UIFont systemFontOfSize:12];
    [leftView addSubview:leftTitle];
    
    _todayDividedLB = [UILabel new];
    _todayDividedLB.font = [UIFont systemFontOfSize:12];
    _todayDividedLB.textColor = [UIColor whiteColor];
    _todayDividedLB.text = @"0.00";
    [leftView addSubview:_todayDividedLB];
    
    
    
    UIView  * rightView = [UIView new];
//    rightView.backgroundColor = [UIColor clearColor];
//    rightView.alpha = 0.3;
    [view addSubview:rightView];
    
    UILabel * rightTitle = [UILabel new];
    rightTitle.text = @"总分成(元)";
    rightTitle.textColor = [UIColor lightGrayColor];
    rightTitle.font  = [UIFont systemFontOfSize:12];
    [rightView addSubview:rightTitle];
    
    _dividedLB = [UILabel new];
    _dividedLB.font = [UIFont systemFontOfSize:12];
    _dividedLB.textColor = [UIColor whiteColor];
    _dividedLB.text = @"100.00";
    [rightView addSubview:_dividedLB];
    

    
    
    
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(view);
        make.top.equalTo(view).offset(20);
        
    }];
    
    
    
    [_balanceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(view);
        make.top.equalTo(titleLB.mas_bottom).offset(20);

    }];
    
    [_freezeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(view);
        make.top.equalTo(_balanceLB.mas_bottom).offset(20);
    }];
    
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.bottom.equalTo(view);
        make.width.equalTo(view).multipliedBy(0.5);
        
    }];
    
    [leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(leftView);
        make.top.equalTo(leftView).offset(10);
    }];
    
    [_todayDividedLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(leftView);
        make.top.equalTo(leftTitle.mas_bottom).offset(10);
        make.bottom.equalTo(leftView).offset(-10);
        
    }];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.bottom.equalTo(view);
        make.width.equalTo(view).multipliedBy(0.5);
        
    }];
    
    [rightTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(rightView);
        make.top.equalTo(rightView).offset(10);
    }];
    
    [_dividedLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(rightView);
        make.top.equalTo(rightTitle.mas_bottom).offset(10);
        make.bottom.equalTo(rightView).offset(-10);
        
    }];
    
    
    return view;
    
}

- (void)freezeText:(NSString *)number{
    
    
    NSString * str = [NSString stringWithFormat:@"冻结余额 %@元",number];
    
    NSMutableAttributedString * text= [[NSMutableAttributedString alloc] initWithString:str];
    
    text.color = [UIColor whiteColor];
    
//    [text setColor:RGB(247, 98, 96)range:[number rangeOfString:countdown]];
    
    YYAnimatedImageView *imageView1= [[YYAnimatedImageView alloc] initWithImage:[UIImage imageNamed:@"n_select"]];
    imageView1.frame = CGRectMake(0, 0, 12, 12);
    
    NSMutableAttributedString *attachText1= [NSMutableAttributedString attachmentStringWithContent:imageView1 contentMode:UIViewContentModeScaleAspectFit attachmentSize:imageView1.frame.size alignToFont:[UIFont systemFontOfSize:12] alignment:YYTextVerticalAlignmentCenter];
    
    
    [text insertAttributedString:attachText1 atIndex:0];
    
    [text insertString:@"  " atIndex:1];
    _freezeLB.attributedText = text;

}


@end
