//
//  ChannelMerchantsHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/23.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ChannelMerchantsHelper.h"
#import "InputTableViewCell.h"
#import "TextViewTableViewCell.h"
@interface ChannelMerchantsHelper()

@property (nonatomic, strong) InputTableViewCell * nameCell;
@property (nonatomic, strong) InputTableViewCell * personNumCell;
@property (nonatomic, strong) InputTableViewCell * adressCell;
@property (nonatomic, strong) InputTableViewCell * scopeCell;
@property (nonatomic, strong) TextViewTableViewCell * detailCell;


@property (nonatomic, strong) NSArray * rows;


@end

@implementation ChannelMerchantsHelper



+(instancetype)blog{
    
    return [[ChannelMerchantsHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.estimatedRowHeight = 44;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.tableFooterView = [self creatBottomView];
        self.rows = @[self.nameCell,self.personNumCell,self.adressCell,self.scopeCell,self.detailCell];
        
        
        [_tableView scrollToTop];
        
    }
    
    return self;
    
    
}



- (void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    
    [self.tableView reloadData];
    
}





#pragma mark  tableview代理方法



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    
    
    return [self creatSectionHead];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return _rows.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    return _rows[indexPath.row];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}



- (InputTableViewCell *)nameCell{
    
    if (!_nameCell) {
        
        _nameCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入公司名称" title:@"公司名称"];
        [_nameCell editStyle:YES];
    }
    
    return _nameCell;
}



- (InputTableViewCell *)personNumCell{
    
    if (!_personNumCell) {
        
        _personNumCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入公司人数" title:@"公司人数"];
        [_personNumCell editStyle:YES];
    }
    
    return _personNumCell;
}
- (InputTableViewCell *)adressCell{
    
    if (!_adressCell) {
        
        _adressCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入公司地址" title:@"公司地址"];
        [_adressCell editStyle:YES];
    }
    
    return _adressCell;
}
- (InputTableViewCell *)scopeCell{
    
    if (!_scopeCell) {
        
        _scopeCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入经营范围" title:@"经营范围"];
        [_scopeCell editStyle:YES];
    }
    
    return _scopeCell;
}

- (TextViewTableViewCell *)detailCell{
    
    if (!_detailCell) {
        
        _detailCell = [[TextViewTableViewCell alloc]initWithPlaceHold:@"备注信息"];
    }
    
    return _detailCell;
}


- (UIView *)creatSectionHead{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor = UICOLORRGB(0xf5f5f5);
    
    UILabel * nameLB= [UILabel new];
    nameLB.font = [UIFont systemFontOfSize:14];
    nameLB.textColor = [UIColor blackColor];
    nameLB.text =  @"合作商家信息(可跳过)";
    [view addSubview:nameLB];
    
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(view);
        make.left.equalTo(view).offset(20);
        
    }];
    
    return view;
    
}


- (UIView * )creatBottomView{
    
    UIView * backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    UIView * line = [UIView new];
    line.backgroundColor = UICOLORRGB(0xf5f5f5);
    [backgroundView addSubview:line];
    
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:[UIColor cyanColor]];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5 ;
    [button setTitle:@"下一步" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextstep:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(backgroundView);
        make.height.mas_equalTo(@1);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backgroundView.mas_bottom).offset(-10);
        make.centerX.equalTo(backgroundView);
        make.size.mas_equalTo(CGSizeMake(WIDTH*0.7, 40));
    }];
    
    
    
    return backgroundView;
}

- (void)nextstep:(UIButton *)sender{
    
    
    
    if (self.nextStep) {
        
        self.nextStep(2);
    }
    
    
}

@end
