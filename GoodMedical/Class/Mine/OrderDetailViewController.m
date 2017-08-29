//
//  OrderDetailViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/8/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "OrderDetailHelper.h"
@interface OrderDetailViewController ()

@property (nonatomic, strong) OrderDetailHelper * orderHelper;

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"订单详情";
    
    [self setSubviews];
    [self creatBottomViewWithIsPay:YES];
    
}

- (void)setSubviews{
    
    
    _orderHelper = [OrderDetailHelper blog];
    [self.view addSubview:_orderHelper.tableView];
    
    WEAKSELF(wk);
    
    [_orderHelper.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.equalTo(wk.view);
        make.bottom.equalTo(wk.view).offset(-40);
    }];
    
    
    
}

- (void)creatBottomViewWithIsPay:(BOOL)isPay{
    
    UIView  * view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    WEAKSELF(wk);
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(wk.view);
        make.top.equalTo(wk.orderHelper.tableView.mas_bottom);
    }];
    
    if (isPay) {
        
        NSArray * array = @[@"取消预约",@"去支付"];
       CGFloat w = WIDTH/2;
        for (int i = 0 ; i < array.count; i++) {
            
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:array[i] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.frame = CGRectMake(i*w, 0, w, 40);
            button.tag = i+100;
            if (i==0) {
                
                [button setBackgroundColor:UICOLORRGB(0x2ecaff)];
            }else{
                [button setBackgroundColor:[UIColor redColor]];
            }
            [button addTarget:self action:@selector(payClick:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:button];
            
            
        }
        
    }else{
        
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"已取消" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setBackgroundColor:UICOLORRGB(0xf5f5f5)];
        button.frame = CGRectMake(0, 0, WIDTH, 40);
        [view addSubview:button];
    }
    
    
    
    
}


- (void)payClick:(UIButton *)sender{
    
    
    
    
    
    
    
}


@end
