//
//  RecordHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/9/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "RecordHelper.h"
#import "RecordTableViewCell.h"
@interface RecordHelper ()

@end

@implementation RecordHelper



+(instancetype)blog{
    
    return [[RecordHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.estimatedRowHeight = 44;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        [self.tableView registerNib:[UINib nibWithNibName:@"RecordTableViewCell" bundle:nil] forCellReuseIdentifier:@"record"];
        self.tableView.tableFooterView = [UIView new];
    }
    
    return self;
    
    
}



#pragma mark  tableview代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 10;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RecordTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"record"];
    
    return cell;
    
}


@end
