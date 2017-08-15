//
//  MessageHelp.m
//  GoodMedical
//
//  Created by zhou on 2017/8/14.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MessageHelp.h"
#import "FunctionTableViewCell.h"
#import "MessageTableViewCell.h"
@implementation MessageHelp

+(instancetype)blog{
    
    return [[MessageHelp alloc]init];
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
        [self.tableView registerNib:[UINib nibWithNibName:@"FunctionTableViewCell" bundle:nil] forCellReuseIdentifier:@"function"];
        [self.tableView registerNib:[UINib nibWithNibName:@"MessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"message"];
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
        
        return 3;
    }
    
    
    return 10;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        
        FunctionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"function"];
        
        
        return cell;
        
    }
    MessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"message"];
    
    
    
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    
}





@end
