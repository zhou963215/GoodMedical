//
//  InProjectHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/18.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "InProjectHelper.h"
#import "InProjectPopCell.h"
#import "TotalPriceModel.h"
#import "ShoppingModel.h"
#import "InSelectTableViewCell.h"
#import "MapTableViewCell.h"
#import "InputTableViewCell.h"
#import "DoctorPhotoTableViewCell.h"
#import "TextViewTableViewCell.h"
#import "AdressSelectCell.h"
#import "LocationAdress.h"

@interface InProjectHelper (){
    
    BOOL _isInstitutions;
}

@property (nonatomic, strong) TotalPriceModel * total;
@property (nonatomic, strong) InProjectPopCell * popCell;

//
@property (nonatomic, strong) NSArray * rows;

@property (nonatomic, strong) InputTableViewCell * institutionsNameCell;
@property (nonatomic, strong) AdressSelectCell * institutionsAdressCell;
@property (nonatomic, strong) InputTableViewCell * institutionsDetailAdressCell;
@property (nonatomic, strong) InputTableViewCell * institutionsPhoneCell;
@property (nonatomic, strong) DoctorPhotoTableViewCell * institutionsIconCell;//机构封面
@property (nonatomic, strong) DoctorPhotoTableViewCell * institutionsCardCell;//营业执照
@property (nonatomic, strong) TextViewTableViewCell * institutionsDetailCell;//详细描述


@property (nonatomic, strong) LocationAdress * location;



@end

@implementation InProjectHelper
+(instancetype)blog{
    
    return [[InProjectHelper alloc]init];
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
        [self.tableView registerNib:[UINib nibWithNibName:@"InSelectTableViewCell" bundle:nil] forCellReuseIdentifier:@"pop"];
        [self.tableView registerNib:[UINib nibWithNibName:@"MapTableViewCell" bundle:nil] forCellReuseIdentifier:@"map"];

        _total  = [TotalPriceModel dataModel];
        
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
   
    if (section == 0 || section ==2) {
        
        return 40;
    }else if (section ==3){
        return 1;
    }
    
    
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section ==0) {
     return    [self creatSectionHeadWithTitle:@"入驻项目"];
        
    }else if(section ==2){
        
     return   [self creatSectionHeadWithTitle:@"入驻机构"];
 
    }else if (section == 3 ||section == 4){
        
        UIView * view  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
        view.backgroundColor = UICOLORRGB(0xf5f5f5);
        return view;
    }
    
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (section == 1) {
        
        return _total.shopArray.count;
    }if(section == 2){
        
        return 2;
    }if (section ==4) {
        
        return self.rows.count;
        
    }
    
    
    return 1;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return self.popCell;

    }else if (indexPath.section ==1){
        
        InSelectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"pop"];
        
        ShoppingModel * model = _total.shopArray[indexPath.row];
        
        cell.nameLB.text = [NSString stringWithFormat:@"%@  ¥ %@",model.name,model.inPrice];
        
        return  cell;
    }else if (indexPath.section == 2){
        
        MapTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"map"];
        
        return cell;
    }else if (indexPath.section ==3){
        
        InSelectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"pop"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.nameLB.text = @"我要申请自己的机构";
        
        return  cell;
    }else if (indexPath.section == 4){
        
        return self.rows[indexPath.row];
    }
    
    
    
    
    return [UITableViewCell new];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section ==3) {
                
        if (_isInstitutions) {
            
            _isInstitutions = NO;
            [self.tableView reloadData];
        }else{
            
            [self applicantOrganisation];

        }
        
    }
    
    
}


- (InProjectPopCell *)popCell{
    
    if (!_popCell) {
        
        _popCell = [[InProjectPopCell alloc]initWithTitle:@"选择入驻项目"];
        
    }
    
    return _popCell;
}


#pragma MARK=================

- (InputTableViewCell *)institutionsNameCell{
    
    if (!_institutionsNameCell) {
        
        _institutionsNameCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入机构名称" title:@"机构名称"];
        [_institutionsNameCell editStyle:YES];
    }
    
    return _institutionsNameCell;
}


- (AdressSelectCell *)institutionsAdressCell{
    
    if (!_institutionsAdressCell) {
        
        _institutionsAdressCell = [[AdressSelectCell alloc]init];
        _institutionsAdressCell.nameLB.text = @"所在地区";
        _institutionsAdressCell.label.text = @"请选择地区";
        [_institutionsAdressCell upWidthChange:YES];
        [self refreshAdress];

    }
    
    
    return _institutionsAdressCell;
}

- (InputTableViewCell *)institutionsDetailAdressCell{
    
    if (!_institutionsDetailAdressCell) {
        
        _institutionsDetailAdressCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入详细地址" title:@"详细地址"];
        [_institutionsDetailAdressCell editStyle:YES];
    }
    
    return _institutionsDetailAdressCell;
}


- (InputTableViewCell *)institutionsPhoneCell{
    
    if (!_institutionsPhoneCell) {
        
        _institutionsPhoneCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入负责人电话" title:@"负责人电话"];
        [_institutionsPhoneCell editStyle:YES];

        
    }
    
    return _institutionsPhoneCell;
}

- (DoctorPhotoTableViewCell *)institutionsIconCell{
    
    if (!_institutionsIconCell) {
        
        _institutionsIconCell = [[DoctorPhotoTableViewCell alloc]initWithTitle:@"机构封面"];
    }
    return _institutionsIconCell;
}

- (DoctorPhotoTableViewCell *)institutionsCardCell{
    
    if (!_institutionsCardCell) {
        
        _institutionsCardCell = [[DoctorPhotoTableViewCell alloc]initWithTitle:@"机构营业执照"];
    }
    return _institutionsCardCell;
    
    
}

- (TextViewTableViewCell *)institutionsDetailCell{
    
    if (!_institutionsDetailCell) {
        
        _institutionsDetailCell = [[TextViewTableViewCell alloc]initWithPlaceHold:@"请简单介绍您的机构"];
    }
    return _institutionsDetailCell;
}


- (UIView *)creatSectionHeadWithTitle:(NSString *)title{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor = UICOLORRGB(0xf5f5f5);
    
    UILabel * nameLB= [UILabel new];
    nameLB.font = [UIFont systemFontOfSize:14];
    nameLB.textColor = [UIColor blackColor];
    nameLB.text = title;
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
        
        self.nextStep(3);
    }
    
    
    
}


- (void)applicantOrganisation{
    
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否同意云诊所协议申请自己的机构?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cance = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    
    UIAlertAction *  determine = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        _isInstitutions = !_isInstitutions;
        [self.tableView reloadData];
        
        
    }];
    
    [alert addAction:cance];
    [alert addAction:determine];
    
    [self.tableView.navigationController presentViewController:alert animated:YES completion:^{
        
        
    }];
    
}

- (NSArray *)rows{
    
    if (_isInstitutions) {
        
        _rows = @[self.institutionsNameCell,self.institutionsAdressCell,self.institutionsDetailAdressCell,self.institutionsPhoneCell,self.institutionsIconCell,self.institutionsCardCell,self.institutionsDetailCell];
    }else{
        _rows = @[];
    }
    
    return _rows;
}


- (void)refreshAdress{
    
    WEAKSELF(wk);
    _location = [LocationAdress blogWithVc:self.tableView.navigationController];
    [_location refreshAdress:^(NSString *administrativeArea, NSString *currentCity, NSString *subThoroughfare) {
        
        
        [wk.institutionsAdressCell updateAddressWithProvince:administrativeArea city:currentCity town:subThoroughfare];
        
        NSLog(@"%@==%@==%@",administrativeArea,currentCity,subThoroughfare);
        
    }];
    
}
@end
