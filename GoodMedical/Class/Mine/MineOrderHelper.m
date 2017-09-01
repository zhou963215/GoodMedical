//
//  MineOrderHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MineOrderHelper.h"
#import "OrderTableViewCell.h"
#import "OrderDetailViewController.h"
@interface MineOrderHelper ()

@property (nonatomic, strong) NSMutableArray * buttonArray;

@end

@implementation MineOrderHelper


+(instancetype)blog{
    
    return [[MineOrderHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44;

        [self.tableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"order"];
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
    
    
    OrderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"order"];
    
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
  
    [self.tableView.navigationController pushViewController:[OrderDetailViewController new] animated:YES];
    
}

- (UIView *)creatHeaderView{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    NSArray * arr = @[@"全部",@"待支付",@"已确认",@"已完成",@"已取消"];
    
    CGFloat w = WIDTH/5;
    
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
