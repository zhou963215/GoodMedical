//
//  MembersHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/30.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MembersHelper.h"
#import "LevelTableViewCell.h"
#import "MembersTableViewCell.h"
@interface MembersHelper ()

@property (nonatomic, strong) NSArray * rows;

@property (nonatomic, strong) LevelTableViewCell * levelCell;
@property (nonatomic, strong) MembersTableViewCell * membersCell;

@end

@implementation MembersHelper


+(instancetype)blog{
    
    return [[MembersHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = UICOLORRGB(0xf5f5f5);
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.estimatedRowHeight = 44;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        [self.tableView registerNib:[UINib nibWithNibName:@"MineTableViewCell" bundle:nil] forCellReuseIdentifier:@"mine"];
        [self.tableView registerClass:[LevelTableViewCell class] forCellReuseIdentifier:@"level"];
        self.tableView.tableHeaderView = [self creatHeaderView];
        self.tableView.tableFooterView = [UIView new];
        [self refreshRows];
        
        
    }
    
    return self;
    
    
}


- (void)refreshRows{
    
    self.rows = @[self.levelCell,self.membersCell];
    
    
}

#pragma mark  tableview代理方法


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 80;
    }
    return  UITableViewAutomaticDimension;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return _rows.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    return _rows[indexPath.row];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView.viewController.view endEditing:YES];
    
}


- (LevelTableViewCell *)levelCell{
    
    if (!_levelCell) {
        
        _levelCell = [[LevelTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"level"];

    }
    
    return _levelCell;
}

- (MembersTableViewCell *)membersCell{
    
    if (!_membersCell) {
        
        _membersCell = [[[NSBundle mainBundle]loadNibNamed:@"MembersTableViewCell" owner:self options:nil]firstObject];
        [_membersCell.buyBtn addTarget:self action:@selector(buyMembers:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _membersCell;
}

- (UIView *)creatHeaderView{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor = UICOLORRGB(0xf5f5f5);
    
    UILabel * titleLB = [UILabel new];
    titleLB.text = @"请选择购买的包月会员等级";
    titleLB.textColor =UICOLORRGB(0x777777);
    titleLB.font = [UIFont systemFontOfSize:12];
    [view addSubview:titleLB];
    
    
    
    
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(view);
        make.left.equalTo(view).offset(20);
        
    }];
    
    
    
    
    return view;
    
}

- (void)buyMembers:(UIButton *)sender{
    
    
    if (_levelCell.select == 0) {
        
        [ZHHud initWithMessage:@"请选择购买会员等级"];
        
        return;
    }
    
    NSLog(@"%ld",(long)_levelCell.select);
    
    
    
    
}


@end
