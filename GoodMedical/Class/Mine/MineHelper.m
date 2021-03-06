//
//  MineHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/10.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MineHelper.h"
#import "MineTableViewCell.h"
#import "CertificationSelectVC.h"
#import "DetailMineViewController.h"
#import "AccountCenterVC.h"
#import "MineOrderViewController.h"
#import "MineAppointmentVC.h"
#import "MembersViewController.h"
#import "ChangePhoneViewController.h"
@interface MineHelper ()
@property (strong, nonatomic) UIImageView *imageView;

@property (nonatomic, strong) NSArray * rows;

@end

@implementation MineHelper

+(instancetype)blog{
    
    return [[MineHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.rowHeight = 44;
        [self.tableView registerNib:[UINib nibWithNibName:@"MineTableViewCell" bundle:nil] forCellReuseIdentifier:@"mine"];
        self.tableView.tableFooterView = [self creatBottomView];
        _tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
        [self.tableView addSubview:self.imageView];
        [_tableView scrollToTop];
        [self refreshRows];
        
    }
    return self;
    
}


- (void)refreshRows{
    
    
    
//     self.rows = @[@[@{@"name":@"认证入住",@"detail":@"还未认证"}],@[@{@"name":@"预约订单",@"detail":@"3"},@{@"name":@"绑定手机号",@"detail":@"13838838438"}],@[@{@"name":@"设置",@"detail":@""},@{@"name":@"关于我们",@"detail":@""},@{@"name":@"客服电话",@"detail":@"400-001-2018"}]];
    self.rows = @[@[@{@"name":@"账户中心",@"detail":@""}],@[@{@"name":@"客户端订单",@"detail":@""},@{@"name":@"医生端订单",@"detail":@""},@{@"name":@"邀请患者",@"detail":@""},@{@"name":@"我的主页",@"detail":@""}],@[@{@"name":@"我的预约订单",@"detail":@"3"},@{@"name":@"我的预约",@"detail":@"3"},@{@"name":@"绑定手机号",@"detail":@"13838838438"}],@[@{@"name":@"包月会员购买",@"detail":@""},@{@"name":@"抵用券",@"detail":@"0张可用"},@{@"name":@"设置",@"detail":@""},@{@"name":@"关于我们",@"detail":@""},@{@"name":@"客服电话",@"detail":@"400-001-2018"}]];
    
}

- (void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    
    [self.tableView reloadData];
    
}





#pragma mark  tableview代理方法

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == _rows.count-1) {
        
        return 0.1;
    }
    return 15;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
   return  self.rows.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray * arr = _rows[section];
    
    
    return arr.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSDictionary * dict = _rows[indexPath.section][indexPath.row];
    MineTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"mine"];
    [cell upDataWithDict:dict];
    
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary * dict = _rows[indexPath.section][indexPath.row];
    
    if ([dict[@"name"]isEqualToString:@"账户中心"]) {
        
        [self.tableView.navigationController pushViewController:[AccountCenterVC new] animated:YES];
        
    } if ([dict[@"name"]isEqualToString:@"客户端订单"]) {
        
        MineOrderViewController * order = [MineOrderViewController new];
        order.type = 1;
        
        [self.tableView.navigationController pushViewController:order animated:YES];
        
    }if ([dict[@"name"]isEqualToString:@"医生端订单"]) {
        
        MineOrderViewController * order = [MineOrderViewController new];
        order.type = 2;
        [self.tableView.navigationController pushViewController:order animated:YES];
        
    }if ([dict[@"name"]isEqualToString:@"我的预约订单"]) {
        MineOrderViewController * order = [MineOrderViewController new];
        order.type = 3;
        [self.tableView.navigationController pushViewController:order animated:YES];
        
    }if ([dict[@"name"]isEqualToString:@"我的预约"]) {
        
        [self.tableView.navigationController pushViewController:[MineAppointmentVC new] animated:YES];
        
    }if ([dict[@"name"]isEqualToString:@"包月会员购买"]) {
        
        [self.tableView.navigationController pushViewController:[MembersViewController new] animated:YES];
        
    }if ([dict[@"name"]isEqualToString:@"客服电话"]) {
        
        [self callPhoneWihtNumber:dict[@"detail"]];
    }if ([dict[@"name"]isEqualToString:@"绑定手机号"]) {
        
        [self.tableView.navigationController pushViewController:[ChangePhoneViewController new] animated:YES];
    }

    
//    [self.tableView.navigationController pushViewController:[CertificationSelectVC new] animated:YES];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat off_y = scrollView.contentOffset.y;
    if (off_y < - 200)
    {
        CGRect frame = self.imageView.frame;
        self.imageView.frame = CGRectMake(0, off_y, frame.size.width, -off_y);
    }
}

-(UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -200, WIDTH, 200)];
        _imageView.image = [UIImage imageNamed:@"a1.jpg"];
        _imageView.userInteractionEnabled = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        
        [self creatMineView];
        
        
    }
    
    return _imageView;
}


- (void)creatMineView{
    
    
    UIView * view = [UIView new];
    view.backgroundColor =  UICOLORRGB(0xf5f5f5);
    view.userInteractionEnabled  = YES;

    [_imageView addSubview:view];
    
    UIView * bottom = [UIView new];
    bottom.backgroundColor = [UIColor whiteColor];
    [view addSubview:bottom];

    UIImageView * headImage = [UIImageView new];
    headImage.layer.masksToBounds = YES;
    headImage.layer.cornerRadius = 25;
    headImage.backgroundColor = [UIColor redColor];
    [bottom addSubview:headImage];
    
    UILabel * nameLabel = [UILabel new];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.text = @"六多兰盖伦";
    [bottom addSubview:nameLabel];
    
    
    WEAKSELF(wk);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(wk.imageView);
        make.height.mas_equalTo(@64);
    }];
    
    
    [headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerY.equalTo(bottom.mas_top);
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(headImage.mas_right).offset(10);
        make.centerY.equalTo(bottom);
    }];
    
    [bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.equalTo(view);
        make.height.mas_equalTo(44);
    }];
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    tap.numberOfTapsRequired=1;//单击
    tap.numberOfTouchesRequired=1;//单点触碰
    [view addGestureRecognizer:tap];
    
    
    
}

- (void)tapClick:(id)sender{
    
    NSLog(@"每天都在想着下班回家睡觉");
    
    [self.tableView.navigationController pushViewController:[DetailMineViewController new] animated:YES];
    
    
}

- (UIView * )creatBottomView{
    
    UIView * backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
    backgroundView.backgroundColor = GAYCOLOR;
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:[UIColor cyanColor]];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5 ;
    [button setTitle:@"退出登录" forState:UIControlStateNormal];
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

- (void)callPhoneWihtNumber:(NSString * )phoneNumber{
    
    
    NSString *num = [NSString stringWithFormat:  @"telprompt://%@",phoneNumber]; //而这个方法则打电话前先弹框 是否打电话 然后打完电话之后回到程序中 网上说这个方法可能不合法 无法通过审核
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
    
    
    
}


@end
