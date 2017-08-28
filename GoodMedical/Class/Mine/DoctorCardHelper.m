//
//  DoctorCardHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/22.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "DoctorCardHelper.h"
#import "InputTableViewCell.h"
#import "DoctorPhotoTableViewCell.h"
#import "AgreedView.h"
@interface DoctorCardHelper ()

@property (nonatomic, strong) NSArray * rows;

@property (nonatomic, strong) InputTableViewCell * cardNameCell;
@property (nonatomic, strong) InputTableViewCell * cardCell;
@property (nonatomic, strong) InputTableViewCell * cardAdressCell;
@property (nonatomic, strong) InputTableViewCell * mineCardCell;

@property (nonatomic, strong) DoctorPhotoTableViewCell * cardPhotoCell;

@property (nonatomic, strong) AgreedView * agreedView;

@end


@implementation DoctorCardHelper



+(instancetype)blog{
    
    return [[DoctorCardHelper alloc]init];
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
        self.rows = @[self.cardNameCell,self.cardCell,self.cardAdressCell,self.mineCardCell,self.cardPhotoCell];
        
        
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


- (InputTableViewCell *)cardNameCell{
    
    if (!_cardNameCell) {
        
        _cardNameCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入开户名" title:@"开户名"];
    }
    return _cardNameCell;
}

- (InputTableViewCell *)cardCell{
    
    if (!_cardCell) {
        
        _cardCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入银行卡号" title:@"卡号"];
    }
    return _cardCell;
}

- (InputTableViewCell *)cardAdressCell{
    
    if (!_cardAdressCell) {
        
        _cardAdressCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入开户行" title:@"开户行"];
    }
    return _cardAdressCell;
}

- (InputTableViewCell *)mineCardCell{
    
    if (!_mineCardCell) {
        
        _mineCardCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入身份证号码" title:@"身份证号"];
    }
    return _mineCardCell;
}


- (DoctorPhotoTableViewCell *)cardPhotoCell{
    
    if (!_cardPhotoCell) {
        
        _cardPhotoCell = [[DoctorPhotoTableViewCell alloc]initWithTitle:@"身份证照(必须为正面手持照片)"];
        
        
    }
    
    return _cardPhotoCell;
}



- (UIView *)creatSectionHead{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor = UICOLORRGB(0xf5f5f5);
    
    UILabel * nameLB= [UILabel new];
    nameLB.font = [UIFont systemFontOfSize:14];
    nameLB.textColor = [UIColor blackColor];
    nameLB.text =  @"结算信息";
    [view addSubview:nameLB];
    
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(view);
        make.left.equalTo(view).offset(20);
        
    }];
    
    return view;
    
}

- (UIView * )creatBottomView{
    
    
    
    UIView * backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    UIView * line = [UIView new];
    line.backgroundColor = UICOLORRGB(0xf5f5f5);
    [backgroundView addSubview:line];
    
    _agreedView = [AgreedView new];
    [backgroundView addSubview:_agreedView];
    
    
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:[UIColor cyanColor]];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5 ;
    [button setTitle:@"提交入驻" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextstep:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(backgroundView);
        make.height.mas_equalTo(@1);
    }];

    [_agreedView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(backgroundView).offset(30);
        make.left.right.equalTo(backgroundView);
        make.height.mas_equalTo(@40);
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
        
        self.nextStep(3);
    }
    
    
}


@end
