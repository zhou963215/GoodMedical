//
//  AppointmentHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/29.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AppointmentHelper.h"
#import "OrderDetailTableViewCell.h"
@implementation AppointmentHelper


+(instancetype)blog{
    
    return [[AppointmentHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44;
        
        [self.tableView registerNib:[UINib nibWithNibName:@"OrderDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"order"];
        self.tableView.tableFooterView = [UIView new];
        
    }
    
    return self;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
   
    return 40;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    
    return [self creatSectionHead:section];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        
        return 6;
    }
        return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OrderDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"order"];
    
    return cell;
    

}

- (UIView *)creatSectionHead:(NSInteger)section{
    
    NSArray * arr = @[@"预约信息",@"机构信息"];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor = UICOLORRGB(0xf5f5f5);
    
    UILabel * nameLB= [UILabel new];
    nameLB.font = [UIFont systemFontOfSize:14];
    nameLB.textColor = [UIColor blackColor];
    nameLB.text = arr[section];
    [view addSubview:nameLB];
    
    //    WEAKSELF(wk)
    
    
    
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(view);
        make.left.equalTo(view).offset(20);
        
    }];
    
    
    
    return view;
    
    
}

@end
