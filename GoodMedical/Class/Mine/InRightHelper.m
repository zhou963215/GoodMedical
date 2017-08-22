//
//  InRightHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/17.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "InRightHelper.h"
#import "InRightTableViewCell.h"
#import "TotalPriceModel.h"
#import "ShoppingModel.h"

@interface InRightHelper ()

{
    NSIndexPath * index;
}

@end

@implementation InRightHelper


+(instancetype)blog{
    
    return  [[InRightHelper alloc]init];
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
        [self.tableView registerClass:[InRightTableViewCell class] forCellReuseIdentifier:@"right"];
        UIView  * view = [UIView new];
        self.tableView.tableFooterView = view;
        
        _selectArray = [NSMutableArray array];
        
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
    
    InRightTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"right"];
    
    [cell setUpDataWithModel:_dataArray[indexPath.row]];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView endEditing:YES];
    
    TotalPriceModel * total = [TotalPriceModel dataModel];
    
    InRightTableViewCell * cell = (InRightTableViewCell *) [self.tableView cellForRowAtIndexPath:indexPath];
    
    cell.isSelect = !cell.isSelect;
    
//    BOOL isIn = NO;
//    
//    for (ShoppingModel * model in total.shopChangeArray) {
//        
//        if ([cell.dataModel.name isEqualToString:model.name]) {
//            
//            isIn = YES;
//            model.isRemove = !cell.isSelect;
//        }
//        
//    }
//    
//    if (!isIn) {
//        
//        cell.dataModel.isRemove =!cell.isSelect;
//        [total.shopChangeArray addObject:cell.dataModel];
//        
//    }

    if (cell.isSelect) {
        
        [total.shopChangeArray addObject:cell.dataModel];
        
    }else{
        [total.shopChangeArray removeObject:cell.dataModel];
    }
    
    
//    index = indexPath;
    
//    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(selectDataAdd) object:nil];
//    [self performSelector:@selector(selectDataAdd) withObject:nil afterDelay:0.1];
    
    
}


- (void)selectDataAdd{
    
  
    
}


@end
