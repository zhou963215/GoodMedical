//
//  ClassificationHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/7/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ClassificationHelper.h"
#import "OperationTableViewCell.h"
@interface ClassificationHelper(){
    
//    NSDictionary * lastSelectDict;
}



@end

@implementation ClassificationHelper
+(instancetype)blog{
    
    return  [[ClassificationHelper alloc]init];
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
        [self.tableView registerNib:[UINib nibWithNibName:@"OperationTableViewCell" bundle:nil] forCellReuseIdentifier:@"op"];
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
    
    OperationTableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"op"];
    cell.backgroundColor = [UIColor cyanColor];
    NSString * str = self.lastSelectDict[@"name"];
    
    BOOL  isSelect = [str isEqualToString:_dataArray[indexPath.row]];
    
    [cell selectedType:isSelect];
        
    cell.nameLabel.text = _dataArray[indexPath.row];
    return cell;
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString * str = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    self.lastSelectDict = @{@"name":str};
    
    [tableView reloadData];
    
}

- (void)setLastSelectDict:(NSDictionary *)lastSelectDict{
    
    _lastSelectDict = lastSelectDict;
    [self.tableView reloadData];
    
        
}



@end
