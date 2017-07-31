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
@interface TestTableViewController ()

@property (nonatomic, strong) NSArray * rows;

@property (nonatomic , strong) InputTableViewCell * inputCell;
@property (nonatomic , strong) OperationProjectCell * operation;
@property (nonatomic , strong) ProjectPopCell * project;
@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.rows = @[self.inputCell,self.operation,self.project];
    
    
    PeriodTimeView * time = [[PeriodTimeView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 345)];
    [self.tableView setTableHeaderView:time];
   
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return _rows[indexPath.row];
}



- (InputTableViewCell *)inputCell{
    
    if (!_inputCell) {
        
        _inputCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入姓名" title:@"姓名"];
//        [_inputCell boldLine];
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

@end
