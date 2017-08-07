//
//  AddCasesHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/5.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AddCasesHelper.h"
#import "ZHDateCell.h"
#import "InputTableViewCell.h"
#import "ZHPickerCell.h"
@interface AddCasesHelper ()

@property (nonatomic, strong) ZHDateCell * firstDateCell;//首诊日期
@property (nonatomic, strong) InputTableViewCell * nameCell;//姓名
@property (nonatomic, strong) ZHPickerCell * sexCell;//性别
@property (nonatomic, strong) InputTableViewCell * ageCell;//年龄
@property (nonatomic, strong) ZHDateCell * dateBrithCell;//生日
@property (nonatomic, strong) InputTableViewCell * phoneCell;//电话
@property (nonatomic, strong) InputTableViewCell * emergencyNameCell;//紧急联系人姓名
@property (nonatomic, strong) InputTableViewCell * emergencyRelationshipCell;//紧急联系人关系
@property (nonatomic, strong) InputTableViewCell * emergencyPhoneCell;//紧急联系人电话
@property (nonatomic, strong) InputTableViewCell * casesNumberCell;//病历编号
@property (nonatomic, strong) InputTableViewCell * doorNumberCell;//门诊号
@property (nonatomic, strong) InputTableViewCell * historyCell;//历史
@property (nonatomic, strong) InputTableViewCell * cardCell;//身份证号码
@property (nonatomic, strong) InputTableViewCell * addressCell;//住址

@property (nonatomic, strong) NSArray * rows;

@end

@implementation AddCasesHelper
+(instancetype)blog{
    
    return [[AddCasesHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44;
        UIView  * view = [UIView new];
        self.tableView.tableFooterView = view;
        
        self.rows = @[self.firstDateCell,self.nameCell,self.sexCell,self.ageCell,self.dateBrithCell,self.phoneCell,self.emergencyNameCell,self.emergencyRelationshipCell,self.emergencyPhoneCell,self.casesNumberCell,self.doorNumberCell,self.historyCell,self.cardCell,self.addressCell];
        
        
        
    }
    
    return self;
    
    
}

- (void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    
    [self.tableView reloadData];
    
}


- (NSDictionary *)casesDict{
   
    
    
    
    
    
    return _casesDict;
}


#pragma mark  tableview代理方法


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.rows.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.rows[indexPath.row];
    
}

- (ZHDateCell *)firstDateCell{
    
    if (!_firstDateCell) {
        
        _firstDateCell = [[ZHDateCell alloc]init];
        _firstDateCell.nameLB.text = @"首诊日期";
        _firstDateCell.disabled = NO;
        [_firstDateCell setPlaceholder:@"请选择首诊日期"];
//        _firstDateCell.fromNow = YES;
        _firstDateCell.showDate = YES;
        _firstDateCell.dateFormat = @"yyyy-MM-dd";
        [_firstDateCell upWidthChange:YES];
        
    }
    
    return _firstDateCell;
}

- (InputTableViewCell *)nameCell{
    
    if (!_nameCell) {
        
        _nameCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入姓名" title:@"姓名"];
        [_nameCell editStyle:YES];
    }
    
    return _nameCell;
    
}

- (ZHPickerCell *)sexCell{
    
    if (!_sexCell){
        
        _sexCell = [[ZHPickerCell alloc]initWithRows:@[@"男",@"女"] rowValues:@[@"男",@"女"]];
        _sexCell.nameLB.text = @"性别";
        
        [_sexCell setPlaceholder:@"请选择性别"];
        [_sexCell upWidthChange:YES];
    }
    
    
    return _sexCell;
}

- (InputTableViewCell *)ageCell{
    
    if (!_ageCell) {
        
        _ageCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入年龄" title:@"年龄"];
        _ageCell.inupt.keyboardType = UIKeyboardTypeNumberPad;
        [_ageCell editStyle:YES];
    }
    
    return _ageCell;
    
}
- (ZHDateCell *)dateBrithCell{
    
    if (!_dateBrithCell) {
        
        _dateBrithCell = [[ZHDateCell alloc]init];
        _dateBrithCell.nameLB.text = @"出生日期";
        _dateBrithCell.disabled = NO;
        [_dateBrithCell setPlaceholder:@"请选择出生日期"];
//        _dateBrithCell.fromNow = YES;
        _dateBrithCell.showDate = YES;
        _dateBrithCell.dateFormat = @"yyyy-MM-dd";
        [_dateBrithCell upWidthChange:YES];
        
    }
    
    return _dateBrithCell;
}

- (InputTableViewCell *)phoneCell{
    
    if (!_phoneCell) {
        
        _phoneCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入手机号码" title:@"手机号码"];
        _phoneCell.inupt.keyboardType = UIKeyboardTypePhonePad;
        [_phoneCell editStyle:YES];
    }
    
    return _phoneCell;
    
}

- (InputTableViewCell *)emergencyNameCell{
    
    if (!_emergencyNameCell) {
        
        _emergencyNameCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入紧急联系人" title:@"紧急联系人"];
        [_emergencyNameCell editStyle:YES];
    }
    
    return _emergencyNameCell;
    
}

- (InputTableViewCell *)emergencyRelationshipCell{
    
    if (!_emergencyRelationshipCell) {
        
        _emergencyRelationshipCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入紧急联系人关系" title:@"联系人关系"];
        [_emergencyRelationshipCell editStyle:YES];
    }
    
    return _emergencyRelationshipCell;
    
}

- (InputTableViewCell *)emergencyPhoneCell{
    
    if (!_emergencyPhoneCell) {
        
        _emergencyPhoneCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入紧急联系人关系电话号码" title:@"联系人号码"];
        _emergencyPhoneCell.inupt.keyboardType = UIKeyboardTypePhonePad;

        [_emergencyPhoneCell editStyle:YES];
    }
    
    return _emergencyPhoneCell;
    
}

- (InputTableViewCell *)casesNumberCell{
    
    if (!_casesNumberCell) {
        
        _casesNumberCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入病例编号" title:@"病例编号"];
        _casesNumberCell.inupt.keyboardType = UIKeyboardTypePhonePad;
        
        [_casesNumberCell editStyle:YES];
    }
    
    return _casesNumberCell;
    
}

- (InputTableViewCell *)doorNumberCell{
    
    if (!_doorNumberCell) {
        
        _doorNumberCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入门诊号" title:@"门诊号"];
        _doorNumberCell.inupt.keyboardType = UIKeyboardTypePhonePad;
        
        [_doorNumberCell editStyle:YES];
    }
    
    return _doorNumberCell;
    
}

- (InputTableViewCell *)historyCell{
    
    if (!_historyCell) {
        
        _historyCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入历史" title:@"历史"];
        
        [_historyCell editStyle:YES];
    }
    
    return _historyCell;
    
}


- (InputTableViewCell *)cardCell{
    
    if (!_cardCell) {
        
        _cardCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入身份证号" title:@"身份证"];
        
        [_cardCell editStyle:YES];
    }
    
    return _cardCell;
    
}

- (InputTableViewCell *)addressCell{
    
    if (!_addressCell) {
        
        _addressCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入住宅地址" title:@"住址"];
        
        [_addressCell editStyle:YES];
    }
    
    return _addressCell;
    
}


@end
