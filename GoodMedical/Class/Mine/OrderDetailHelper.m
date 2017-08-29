
//
//  OrderDetailHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/29.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "OrderDetailHelper.h"
#import "OrderDetailTableViewCell.h"
#import "ConsumablesTableViewCell.h"
#import "OrderPriceTableViewCell.h"
@interface OrderDetailHelper ()

@property (nonatomic, strong) NSArray * orderArray;
@property (nonatomic, strong) NSArray * consumablesArray;
@property (nonatomic, strong) NSArray * institutionsArray;

@end

@implementation OrderDetailHelper

+(instancetype)blog{
    
    return [[OrderDetailHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44;
        
        [self.tableView registerNib:[UINib nibWithNibName:@"OrderDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"order"];
         [self.tableView registerNib:[UINib nibWithNibName:@"ConsumablesTableViewCell" bundle:nil] forCellReuseIdentifier:@"consumables"];
        [self.tableView registerNib:[UINib nibWithNibName:@"OrderPriceTableViewCell" bundle:nil] forCellReuseIdentifier:@"price"];
        self.tableView.tableFooterView = [UIView new];
        
    }
    
    return self;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    if (section == 3) {
        return 1;
    }
    
    return 40;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    if (section == 3) {
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
        view.backgroundColor =UICOLORRGB(0xf5f5f5);
        return view;
    }
    
    return [self creatSectionHead:section];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        
        return 6;
        
    }else if (section ==1){
        
        return 5;
        
    }else if (section == 2){
        
        
        return 2;
    }
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        
        OrderDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"order"];
        
        return cell;
        
    }if (indexPath.section == 1) {
        
        ConsumablesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"consumables"];
        return cell;
    }if (indexPath.section == 2) {
        
        
        OrderDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"order"];
        
        return cell;
    }if (indexPath.section == 3) {
        
        OrderPriceTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"price"];
        
        return cell;
    }
    
    
    
    
    return [UITableViewCell new];
}

- (UIView *)creatSectionHead:(NSInteger)section{
    
    NSArray * arr = @[@"订单信息",@"耗材信息",@"机构信息"];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor = UICOLORRGB(0xf5f5f5);
    
    UILabel * nameLB= [UILabel new];
    nameLB.font = [UIFont systemFontOfSize:14];
    nameLB.textColor = [UIColor blackColor];
    nameLB.text = arr[section];
    [view addSubview:nameLB];
    
    //    WEAKSELF(wk)
    
   
    
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(view);
        make.left.equalTo(view).offset(20);
        
    }];
    
    
    
    return view;
    
    
}


@end
