//
//  AppointmentFHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AppointmentFHelper.h"
#import "MapTableViewCell.h"
#import "AppointTableViewCell.h"
#import "PlatformDetailViewController.h"
#import "TotalPriceModel.h"
#import "AppointmentSVC.h"
@interface AppointmentFHelper ()

@property (nonatomic, strong) AppointTableViewCell * calendarCell;
@end

@implementation AppointmentFHelper

+(instancetype)blog{
    
    return [[AppointmentFHelper alloc]init];
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
        [self.tableView registerNib:[UINib nibWithNibName:@"MapTableViewCell" bundle:nil] forCellReuseIdentifier:@"map"];
        self.tableView.tableFooterView = [self creatBottomView];
        
        [TotalPriceModel dataModel].dateString = [[TotalPriceModel dataModel]defaultDate];
        
        
        
    }
    
    return self;
    
    
}

- (void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    
    [self.tableView reloadData];
    
}





#pragma mark  tableview代理方法


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return [self creatSectionHead:YES];
    }else if (section == 1){
        
        return [self creatSectionHead:NO];
    }
    
    
    return nil;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 1;
    }
    
    
    return 1;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0 ) {
        
        MapTableViewCell * map = [tableView dequeueReusableCellWithIdentifier:@"map"];
        
        return map;
    }else{
        return self.calendarCell;
        
    }
    
    return [UITableViewCell new];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}


- (AppointTableViewCell *)calendarCell{
    
    if (!_calendarCell) {
        
        _calendarCell = [[AppointTableViewCell alloc]init];
        
    }
    
    return _calendarCell;
}


- (UIView * )creatBottomView{
    
    UIView * backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 80)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:[UIColor cyanColor]];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5 ;
    [button setTitle:@"下一步" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextstep:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(backgroundView);
        make.size.mas_equalTo(CGSizeMake(WIDTH*0.7, 40));
    }];
    
    
    
    return backgroundView;
}

- (void)nextstep:(UIButton *)sender{
    
    
    
        [sender.navigationController pushViewController:[AppointmentSVC new] animated:YES
         ];
        NSLog(@"单休不开心..");
        
    
}


- (UIView *)creatSectionHead:(BOOL)isHead{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor  = [UIColor whiteColor];
    
    UIView * leftView = [UIView new];
    leftView.backgroundColor = [UIColor cyanColor];
    [view addSubview:leftView];
    
    
    UILabel * nameLB= [UILabel new];
    nameLB.font = [UIFont systemFontOfSize:14];
    nameLB.textColor = [UIColor blackColor];
    nameLB.text = isHead? @"出诊机构" : @"预约时间";
    [view addSubview:nameLB];
    
    //    WEAKSELF(wk)
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.centerY.equalTo (view);
        make.width.mas_equalTo(@4);
        make.height.equalTo(view).multipliedBy(0.8);
        
        
        
    }];
    
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(view);
        make.left.equalTo(leftView.mas_right).offset(10);
        
    }];
    
    if (isHead) {
        
        UIImageView * rightDown = [UIImageView new];
        rightDown.backgroundColor = [UIColor redColor];
        [view addSubview:rightDown];
        
        [rightDown mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(view);
            make.right.equalTo(view).offset(-20);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        
        
        
    }else{
        
        UILabel * detailLB = [UILabel new];
        detailLB.text = @"(以最终确定时间为准)";
        detailLB.textColor = [UIColor orangeColor];
        detailLB.font = [UIFont systemFontOfSize:12];
        [view addSubview:detailLB];
        
        [detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(nameLB.mas_right).offset(10);
            make.bottom.equalTo(nameLB.mas_bottom);
            
        }];
        
        
        
    }
    
    
    return view;
    
    
}

@end
