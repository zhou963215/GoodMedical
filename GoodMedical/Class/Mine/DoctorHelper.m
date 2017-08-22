//
//  DoctorHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/16.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "DoctorHelper.h"
#import "InputTableViewCell.h"
#import "SubjectTableViewCell.h"
#import "AdressSelectCell.h"
#import "LocationAdress.h"
#import "TextViewTableViewCell.h"
@interface DoctorHelper ()

@property (nonatomic, strong) InputTableViewCell * nameCell;
@property (nonatomic, strong) AdressSelectCell * adressCell;
@property (nonatomic, strong) InputTableViewCell * institutionsCell;
@property (nonatomic, strong) InputTableViewCell * departmentCell;
@property (nonatomic, strong) InputTableViewCell * titleCell;
@property (nonatomic, strong) TextViewTableViewCell * detailCell;

@property (nonatomic, strong) NSArray * rows;

@property (nonatomic, strong) LocationAdress * location;

@end

@implementation DoctorHelper


+(instancetype)blog{
    
    return [[DoctorHelper alloc]init];
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
        self.rows = @[self.nameCell,self.adressCell,self.institutionsCell,self.departmentCell,self.titleCell,self.detailCell];
        
        
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
        
        _nameCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入姓名" title:@"姓名"];
        [_nameCell editStyle:YES];
    }
    
    return _nameCell;
}

- (AdressSelectCell *)adressCell{
    
    if (!_adressCell) {
        
        _adressCell = [[AdressSelectCell alloc]init];
        _adressCell.nameLB.text = @"地区";
        _adressCell.label.text = @"请选择地区";
        [_adressCell upWidthChange:YES];
        [self refreshAdress];
    }
    
    return _adressCell;
}

- (InputTableViewCell *)institutionsCell{
    
    if (!_institutionsCell) {
        
        _institutionsCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入所在机构" title:@"所在机构"];
        [_institutionsCell editStyle:YES];
    }
    
    return _institutionsCell;
}
- (InputTableViewCell *)departmentCell{
    
    if (!_departmentCell) {
        
        _departmentCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入科室" title:@"科室"];
        [_departmentCell editStyle:YES];
    }
    
    return _departmentCell;
}
- (InputTableViewCell *)titleCell{
    
    if (!_titleCell) {
        
        _titleCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入职称" title:@"职称"];
        [_titleCell editStyle:YES];
    }
    
    return _titleCell;
}


- (TextViewTableViewCell *)detailCell{
    
    if (!_detailCell) {
        
        _detailCell = [[TextViewTableViewCell alloc]initWithPlaceHold:@"请简单介绍自己"];
    }
    
    return _detailCell;
}

- (void)refreshAdress{
    
    WEAKSELF(wk);
    _location = [LocationAdress blogWithVc:self.tableView.navigationController];
    [_location refreshAdress:^(NSString *administrativeArea, NSString *currentCity, NSString *subThoroughfare) {
        
        
        [wk.adressCell updateAddressWithProvince:administrativeArea city:currentCity town:subThoroughfare];
        
        NSLog(@"%@==%@==%@",administrativeArea,currentCity,subThoroughfare);
        
    }];

}

- (UIView *)creatSectionHead{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor = UICOLORRGB(0xf5f5f5);
    
    UILabel * nameLB= [UILabel new];
    nameLB.font = [UIFont systemFontOfSize:14];
    nameLB.textColor = [UIColor blackColor];
    nameLB.text =  @"基本信息";
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
        
        self.nextStep(1);
    }
    
    
}




@end
