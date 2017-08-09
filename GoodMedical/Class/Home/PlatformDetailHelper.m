//
//  PlatformDetailHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/3.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "PlatformDetailHelper.h"
#import "InputTableViewCell.h"
#import "OperationProjectCell.h"
#import "ProjectPopCell.h"
#import "ShoppingPopCell.h"
#import "ShoppingModel.h"
#import "TotalPriceModel.h"
#import "DetailPlatformCell.h"
#import "TextViewTableViewCell.h"
#import "PriceDetailTableViewCell.h"
#import "PriceDetailCell.h"
#import "PayDetailViewController.h"
@interface PlatformDetailHelper ()

@property (nonatomic, strong) TotalPriceModel * total;


@property (nonatomic, strong) InputTableViewCell * nameInputCell;
@property (nonatomic, strong) InputTableViewCell * phoneInputCell;

@property (nonatomic, strong) OperationProjectCell * operation;
@property (nonatomic, strong) ProjectPopCell * project;
@property (nonatomic, strong) ShoppingPopCell * shop;

@property (nonatomic, strong) TextViewTableViewCell * textCell;

@property (nonatomic, strong) PriceDetailTableViewCell * prcieCell;

@property (nonatomic, strong) PriceDetailCell * newPriceCell;

@property (nonatomic, strong) NSArray * row;
@end

@implementation PlatformDetailHelper
+(instancetype)blog{
    
    return  [[PlatformDetailHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        self.total =[TotalPriceModel dataModel];

        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44;
        self.row = @[self.nameInputCell,self.phoneInputCell,self.operation,self.project,self.shop];
        [self.tableView registerNib:[UINib nibWithNibName:@"DetailPlatformCell" bundle:nil] forCellReuseIdentifier:@"detail"];
        self.tableView.tableFooterView = [self creatBottomView];;
        self.tableView.tableHeaderView = [self sectionHead];
        
        
        
    }
    
    return self;
    
    
}

- (void)setDataArray:(NSArray *)dataArray{
    
//    _dataArray = dataArray;
//    _selectRow = 0;
//    
//    [self.tableView reloadData];
//    
//    [self selectWithIndexPath:_selectRow];
}





#pragma mark  tableview代理方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 2) {
        
        if (_prcieCell.isDetail) {
            
            CGFloat h = 44 +25;
            
            
            if (_total.projectPrice>0) {
                
                h+= 25;
            }if (_total.shopPrice>0) {
                
                h+= 25;
            }
            return h;
            
            
        }
        return 44;
        
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    if (section==3) {
    
        return 20;
    }
    return 0.1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (section==0) {
        
        return _row.count;
 
    }else if(section == 1 ){
      
        return  _total.shopArray.count;

    }
    
    return  1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    if (indexPath.section == 0) {
        
        return _row[indexPath.row];
        
    }else if(indexPath.section == 1){
        
        DetailPlatformCell * cell = [tableView dequeueReusableCellWithIdentifier:@"detail"];
        cell.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        ShoppingModel  * model = _total.shopArray[indexPath.row];
        [cell setUpWithShoppingModel:model];
        
        return cell;
        
    }else if (indexPath.section == 2){
        
        [self.prcieCell calculateThePrice];
        
        return self.prcieCell;
    }
    
    
    return self.textCell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 2) {
        
        
        
        self.prcieCell.isDetail = !self.prcieCell.isDetail;
        
        
        [self.tableView reloadData];

        
    }
    
}

- (InputTableViewCell *)nameInputCell{
    
    if (!_nameInputCell) {
        
        _nameInputCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入姓名" title:@"患者姓名"];
        [_nameInputCell editStyle: YES];
    }
    
    return _nameInputCell;
}

- (InputTableViewCell *)phoneInputCell{
    
    if (!_phoneInputCell) {
        
        _phoneInputCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入电话" title:@"患者电话"];
        [_phoneInputCell editStyle: YES];
    }
    
    return _phoneInputCell;
}


- (OperationProjectCell *)operation{
    
    if (!_operation) {
        
        _operation = [[OperationProjectCell alloc]initWithTitle:@"手术分类"];
        
    }
    
    return _operation;
}
- (ProjectPopCell *)project{
    
    if (!_project) {
        
        _project = [[ProjectPopCell alloc]initWithTitle:@"手术项目"];
        
    }
    
    return _project;
}

- (ShoppingPopCell *)shop{
    
    if (!_shop) {
        
        _shop = [[ShoppingPopCell alloc]initWithTitle:@"收费项目"];
    }
    
    return _shop;
}

- (TextViewTableViewCell *)textCell{
    
    if (!_textCell) {
        
        _textCell =  [[TextViewTableViewCell alloc]initWithPlaceHold:@"请填写备注信息 (选填)"];
        
        
    }
    
    return _textCell;
}


- (PriceDetailTableViewCell *)prcieCell{
    
    if (!_prcieCell) {
        
        _prcieCell = [[PriceDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"prcie"];
    }
    
    
    return _prcieCell;
}
- (PriceDetailCell *)newPriceCell{
    
    if (!_newPriceCell) {
        
        _newPriceCell = [[[NSBundle mainBundle]loadNibNamed:@"PriceDetailCell" owner:self options:nil]firstObject];
    }
    
    
    return _newPriceCell;
}



- (UIView * )creatBottomView{
    
    UIView * backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 80)];
    backgroundView.backgroundColor = GAYCOLOR;
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:[UIColor cyanColor]];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5 ;
    [button setTitle:@"提交预约" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextstep:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(backgroundView);
        make.size.mas_equalTo(CGSizeMake(WIDTH*0.7, 40));
    }];
    
    
    
    return backgroundView;
}


- (void)nextstep:(UIButton *)sender{
    
    if ([_nameInputCell.value isEqualToString:@""]) {
        
        
        [ZHHud initWithMessage:@"请输入患者姓名"];
        return;
    }
    if ([_phoneInputCell.value isEqualToString:@""]) {
        
        [ZHHud initWithMessage:@"请输入患者电话号码"];
        return;
    }
    if (!(_operation.values.count>0)) {
        
        [ZHHud initWithMessage:@"请选择手术分类"];
        return;
    }
    if (!(_project.values.count > 0)) {
        
        [ZHHud initWithMessage:@"请选择手术项目"];
        return;
    }
    
    NSDictionary * dict = @{@"name":_nameInputCell.value,@"phone":_phoneInputCell.value,@"opretion":_operation.values[0],@"project":_project.values[0],@"shop":_total.shopArray,@"area":_textCell.textString};
    
    NSLog(@"单休根本不够休息-------%@",dict);
    
    [self.tableView.navigationController pushViewController:[PayDetailViewController new] animated:YES];
    
    
    
    
}
- (UIView *)sectionHead{
    
    UIView * view  = [[UIView alloc]initWithFrame:CGRectMake(0 , 0, WIDTH, 150)];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    imageView.backgroundColor = [UIColor orangeColor];
    [view addSubview:imageView];
    
    UIImageView * logImage = [UIImageView new];
    logImage.backgroundColor = [UIColor redColor];
    [view addSubview:logImage];
    
    UILabel * nameLabel = [UILabel new];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.text = @"智美好医生";
    [view addSubview:nameLabel];
    
    
    UILabel * timeLabel = [UILabel new];
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.font = [UIFont systemFontOfSize:14];
    timeLabel.text = [NSString stringWithFormat:@"%@  %@-%@",_total.dateString,_total.starCode,_total.endCode];
    [view addSubview:timeLabel];
    
    [logImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.centerX.equalTo(imageView);
        make.top.equalTo(imageView).offset(30);
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(imageView.mas_centerY).offset(10);
        make.centerX.equalTo(imageView);
        
    }];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(imageView).offset(-20);
        make.centerX.equalTo(imageView);
    }];
    
    
    
    
    
    
    return view;
    
}


@end
