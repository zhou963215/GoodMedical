//
//  ShoppingHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ShoppingHelper.h"
#import "ShoppingTableViewCell.h"

@interface ShoppingHelper ()

@end

@implementation ShoppingHelper

+(instancetype)blog{
    
    return  [[ShoppingHelper alloc]init];
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
        [self.tableView registerNib:[UINib nibWithNibName:@"ShoppingTableViewCell" bundle:nil] forCellReuseIdentifier:@"shop"];
        UIView  * view = [UIView new];
        self.tableView.tableFooterView = view;
        
        
        
    }
    
    return self;
    
    
}

- (void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;

    
    [self.tableView reloadData];
    
    
}





#pragma mark  tableview代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _dataArray.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    ShoppingTableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"shop"];
    
    [cell setUpDataWithModel:_dataArray[indexPath.row]];
    
    return cell;
    
    
   
}





@end
