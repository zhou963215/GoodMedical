//
//  MineAppointmentHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/29.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MineAppointmentHelper.h"
#import "AppointmentTableViewCell.h"
#import "AppointmentDetailVC.h"
@interface MineAppointmentHelper ()

@property (nonatomic, strong) NSMutableArray * buttonArray;


@end

@implementation MineAppointmentHelper
+(instancetype)blog{
    
    return [[MineAppointmentHelper alloc]init];
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
        [self.tableView registerNib:[UINib nibWithNibName:@"AppointmentTableViewCell" bundle:nil] forCellReuseIdentifier:@"appointment"];
        self.tableView.tableFooterView = [UIView new];
        self.buttonArray = [NSMutableArray array];
        
    }
    
    return self;
    
    
}



#pragma mark  tableview代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [self creatHeaderView];;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return 10;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    AppointmentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"appointment"];
    
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self.tableView.navigationController pushViewController:[AppointmentDetailVC new] animated:YES];
    
}

- (UIView *)creatHeaderView{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    NSArray * arr = @[@"全部",@"未上门",@"已上门"];
    
    CGFloat w = WIDTH/arr.count;
    
    for (int i = 0; i < arr.count; i++) {
        
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:arr[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:UICOLORRGB(0x888888) forState:UIControlStateNormal];
        [button setTitleColor:UICOLORRGB(0x2ecaff) forState:UIControlStateSelected];
        button.frame = CGRectMake(i*w, 0, w, 40);
        [button setBackgroundColor:UICOLORRGB(0xf5f5f5)];
        button.tag = i+100;
        [button addTarget:self action:@selector(orderTypeChange:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
        
        if (button.tag==100) {
            
            button.selected = YES;
        }
        [self.buttonArray addObject:button];
        
    }
    
    return view;
    
}
- (void)orderTypeChange:(UIButton *)sender{
    
    
    for (UIButton * btn in _buttonArray) {
        
        if (sender.tag == btn.tag) {
            
            btn.selected = YES;
            
        }else{
            btn.selected = NO;
        }
        
    }
    
    
}



@end
