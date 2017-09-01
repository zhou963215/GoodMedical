//
//  ChangePhoneHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/9/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ChangePhoneHelper.h"
#import "InputTableViewCell.h"
#import "CodeTableViewCell.h"
@interface ChangePhoneHelper ()
@property (nonatomic, strong) NSArray * rows;

@property (nonatomic, strong) InputTableViewCell * phoneCell;
@property (nonatomic, strong) CodeTableViewCell * codeCell;


@end

@implementation ChangePhoneHelper
+(instancetype)blog{
    
    return [[ChangePhoneHelper alloc]init];
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
        self.tableView.tableFooterView = [self creatBottomView];
        [_tableView scrollToTop];
        self.rows = @[self.phoneCell,self.codeCell];
    }
    return self;
    
}

#pragma mark  tableview代理方法


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return _rows.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return _rows[indexPath.row];
    
}


- (UIView *)creatHeadView{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 44)];
    
    UILabel * label = [UILabel new];
    label.text = @"当前绑定手机号: 13838838438";
    label.textColor = UICOLORRGB(0x3ea468);
    label.font = [UIFont systemFontOfSize:14];
    [view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(view).offset(20);
        make.centerY.equalTo(view);
    }];
    
    
    return view;
}


- (InputTableViewCell *)phoneCell{
    
    if (!_phoneCell) {
        
        _phoneCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"请输入新的绑定手机号码" title:@"新手机号"];
        _phoneCell.inupt.keyboardType = UIKeyboardTypeNumberPad;

    }
    
    
    
    return _phoneCell;
}

- (CodeTableViewCell *)codeCell{
    
    if (!_codeCell) {
        
        _codeCell = [[CodeTableViewCell alloc]init];
        [_codeCell.codeBtn addTarget:self action:@selector(countdownBtn:) forControlEvents:UIControlEventTouchUpInside];

        
        
        
    }
    
    return _codeCell;
}

- (void)countdownBtn:(CountdownBtn*)btn{
    
    [self.tableView.viewController.view endEditing:YES];
    
    
    if (self.phoneCell.value.length<11) {
        
        [btn stopTime];
        
        [ZHHud initWithMessage:@"请输入正确的手机号码"];
        return;
        
    }
    WEAKSELF(wk);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [wk loginWithBtn:btn];
        
    });
    
    
    
}
- (void)loginWithBtn:(CountdownBtn *)btn{
    
   
    
    //    [[ZHNetWorking sharedZHNetWorking]POSTLOGIN:L_YZM parameters:@{@"phoneNum":_userName.text,@"type":@"1"} success:^(id  _Nonnull responseObject) {
    //
    //
    //
    //    } failure:^(NSError * _Nonnull error) {
    //
    //        [ZHHud initWithMessage:@"获取失败!请检查您的网络"];
    //
    //        
    //    }];
    //    
}

- (UIView * )creatBottomView{
    
    UIView * backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
//    backgroundView.backgroundColor = GAYCOLOR;
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:[UIColor cyanColor]];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5 ;
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextstep:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(backgroundView);
        make.size.mas_equalTo(CGSizeMake(WIDTH*0.7, 40));
    }];
    
    
    
    return backgroundView;
}
//退出登录
- (void)nextstep:(UIButton *)sender{
    
    
    
    
}


@end
