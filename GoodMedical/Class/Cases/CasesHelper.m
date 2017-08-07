//
//  CasesHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/5.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "CasesHelper.h"

@implementation CasesHelper

+(instancetype)blog{
    
    return [[CasesHelper alloc]init];
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
        [self.tableView registerNib:[UINib nibWithNibName:@"MapTableViewCell" bundle:nil] forCellReuseIdentifier:@"map"];
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
    
    if (section == 0) {
        
        return 1;
    }
    
    
    return 1;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     
    return [UITableViewCell new];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}







@end
