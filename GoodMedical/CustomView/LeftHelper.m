//
//  LeftHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/7/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "LeftHelper.h"
#import "LeftTableViewCell.h"
@interface LeftHelper (){
    
    NSInteger _selectRow;
}


@end

@implementation LeftHelper
+(instancetype)blog{
    
    return  [[LeftHelper alloc]init];
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
        [self.tableView registerNib:[UINib nibWithNibName:@"LeftTableViewCell" bundle:nil] forCellReuseIdentifier:@"left"];
        UIView  * view = [UIView new];
        self.tableView.tableFooterView = view;
        
        
      
        
    }
    
    return self;
    
    
}

- (void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    _selectRow = 0;
    
    [self.tableView reloadData];
    
    [self selectWithIndexPath:_selectRow];
}





#pragma mark  tableview代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _dataArray.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LeftTableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"left"];

    [cell selectedType:(indexPath.row ==_selectRow )];
    
    cell.nameLabel.text = _dataArray[indexPath.row];
    return cell;
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _selectRow = indexPath.row;
    [self selectWithIndexPath:indexPath.row];
    [tableView reloadData];
    
    
}

- (void)selectWithIndexPath:(NSInteger)select{
    
    if (self.selected) {
        
        self.selected(select);
    }
    
    
}


@end
