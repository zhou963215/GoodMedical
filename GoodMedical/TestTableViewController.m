//
//  TestTableViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/7/29.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "TestTableViewController.h"
#import "InputTableViewCell.h"
#import "OperationProjectCell.h"
#import "PeriodTimeView.h"
#import "ProjectPopCell.h"
#import "ShoppingPopCell.h"
#import "ShoppingModel.h"
#import "TotalPriceModel.h"
#import "BSLCalendar.h"
@interface TestTableViewController ()

@property (nonatomic, strong) NSArray * rows;
@property (nonatomic, strong) TotalPriceModel * total;


@property (nonatomic, strong) InputTableViewCell * inputCell;
@property (nonatomic, strong) OperationProjectCell * operation;
@property (nonatomic, strong) ProjectPopCell * project;
@property (nonatomic, strong) ShoppingPopCell * shop;
@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.total =[TotalPriceModel dataModel];
    
    self.rows = @[self.inputCell,self.operation,self.project,self.shop];
    
    
    PeriodTimeView * time = [[PeriodTimeView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 345)];
    [self.tableView setTableHeaderView:time];
    BSLCalendar *calendar = [[BSLCalendar alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 300)];
    [self.tableView setTableFooterView :calendar];
    
    calendar.showChineseCalendar = YES;
    [calendar selectDateOfMonth:^(NSInteger year, NSInteger month, NSInteger day) {
        
        NSLog(@"%ld年/%ld月/%ld日",(long)year,(long)month,(long)day);
    }];

   
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section ==0) {
        
        return _rows.count;
    }
    
    return  _total.shopArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0) {
        
        return _rows[indexPath.row];
   
    }else{
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
        }
        
        ShoppingModel  * model = _total.shopArray[indexPath.row];
        cell.textLabel.text = model.name;
        
        return cell;
        
    }
    
    return [UITableViewCell new];
}



- (InputTableViewCell *)inputCell{
    
    if (!_inputCell) {
        
        _inputCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入姓名" title:@"姓名"];
        [_inputCell editStyle: YES];
    }
    
    return _inputCell;
}

- (OperationProjectCell *)operation{
    
    if (!_operation) {
        
        _operation = [[OperationProjectCell alloc]initWithTitle:@"分类"];
        
    }
    
    return _operation;
}
- (ProjectPopCell *)project{
    
    if (!_project) {
        
        _project = [[ProjectPopCell alloc]initWithTitle:@"项目"];
        
    }
    
    return _project;
}

- (ShoppingPopCell *)shop{
    
    if (!_shop) {
        
        _shop = [[ShoppingPopCell alloc]initWithTitle:@"收费项目"];
    }
    
    return _shop;
}

@end
