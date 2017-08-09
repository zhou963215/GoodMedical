//
//  CasesDetailHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/8.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "CasesDetailHelper.h"
#import "CasesTableViewCell.h"
#import "DetailCaseTableViewCell.h"
@implementation CasesDetailHelper

+(instancetype)blog{
    
    return [[CasesDetailHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44;
        [self.tableView registerNib:[UINib nibWithNibName:@"CasesTableViewCell" bundle:nil] forCellReuseIdentifier:@"cases"];
        [self.tableView registerClass:[DetailCaseTableViewCell class] forCellReuseIdentifier:@"detail"];
        
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 1;
    }
    
    
    return _dataArray.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        CasesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cases"];
        
        return cell;
    }else{
        
        DetailCaseTableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:@"detail"];
        
        NSDictionary * dict = _dataArray[indexPath.row];
        
        [cell upDataWithModel:dict];
        
        return cell;
        
    }
    
    
    
    return [UITableViewCell new];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}



@end
