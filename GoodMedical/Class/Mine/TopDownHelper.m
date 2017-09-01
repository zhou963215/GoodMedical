//
//  TopDownHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "TopDownHelper.h"
#import "InputTableViewCell.h"
#import "TopDownTableViewCell.h"
@interface TopDownHelper ()
@property (nonatomic, strong) InputTableViewCell * priceCell;
@property (nonatomic, strong) TopDownTableViewCell * topUpCell;

@property (nonatomic, strong) NSArray * rows;

@end

@implementation TopDownHelper
+(instancetype)blog{
    
    return [[TopDownHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = UICOLORRGB(0xf5f5f5);
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.estimatedRowHeight = 44;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        [self.tableView registerNib:[UINib nibWithNibName:@"MineTableViewCell" bundle:nil] forCellReuseIdentifier:@"mine"];
        self.tableView.tableHeaderView = [self creatHeaderView];
        self.tableView.tableFooterView = [UIView new];
        [self refreshRows];
        
        
    }
    
    return self;
    
    
}


- (void)refreshRows{
    
    self.rows = @[self.priceCell,self.topUpCell];
    
    
}

#pragma mark  tableview代理方法



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _rows.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    return _rows[indexPath.row];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView.viewController.view endEditing:YES];

    
}


- (InputTableViewCell *)priceCell{
    
    if (!_priceCell) {
        
        _priceCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入提现金额" title:@"金额"];
        _priceCell.inupt.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    return _priceCell;
}

- (TopDownTableViewCell *)topUpCell{
    
    if (!_topUpCell) {
        
        _topUpCell = [[[NSBundle mainBundle]loadNibNamed:@"TopDownTableViewCell" owner:self options:nil]firstObject];
        
    }
    return _topUpCell;
}

- (UIView *)creatHeaderView{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor = UICOLORRGB(0xf5f5f5);
    
    UILabel * titleLB = [UILabel new];
    titleLB.text = @"您当前账户总余额为0.00元";
    titleLB.textColor =UICOLORRGB(0x777777);
    titleLB.font = [UIFont systemFontOfSize:12];
    [view addSubview:titleLB];
    
    
    
    
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(view);
        make.left.equalTo(view).offset(20);
        
    }];
    
        
    return view;
    
}

@end
