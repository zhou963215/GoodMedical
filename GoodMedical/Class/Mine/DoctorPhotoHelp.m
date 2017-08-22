//
//  DoctorPhotoHelp.m
//  GoodMedical
//
//  Created by zhou on 2017/8/17.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "DoctorPhotoHelp.h"

#import "DoctorPhotoTableViewCell.h"
#import "ProjectInView.h"
@interface DoctorPhotoHelp ()

@property (nonatomic, strong) DoctorPhotoTableViewCell  * cardCell;
@property (nonatomic, strong) DoctorPhotoTableViewCell  * institutionsCell;


@property (nonatomic, strong) NSArray * rows;

@end

@implementation DoctorPhotoHelp

+(instancetype)blog{
    
    return [[DoctorPhotoHelp alloc]init];
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
        self.tableView.tableFooterView = [self creatBottomView];
        self.rows = @[self.cardCell,self.institutionsCell];
        
        
        [_tableView scrollToTop];
        
    }
    
    return self;
    
    
}



- (void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    
    [self.tableView reloadData];
    
}





#pragma mark  tableview代理方法

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 127.5;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    
//    
//    return 40;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    
//    return [self creatSectionHeadWithSection:section];
//}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
 return _rows.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    return _rows[indexPath.row];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}


- (DoctorPhotoTableViewCell *)cardCell{
    
    if (!_cardCell) {
        
        _cardCell = [[DoctorPhotoTableViewCell alloc]initWithTitle:@"身份证照片(正反两面)"];
    }
    return _cardCell;
}

- (DoctorPhotoTableViewCell *)institutionsCell{
    
    if (!_institutionsCell) {
        
        _institutionsCell = [[DoctorPhotoTableViewCell alloc]initWithTitle:@"医师执业证(正反两面)"];
    }
    return _institutionsCell;
}

- (UIView *)creatSectionHeadWithSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor = UICOLORRGB(0xf5f5f5);
    
    UILabel * nameLB= [UILabel new];
    nameLB.font = [UIFont systemFontOfSize:14];
    nameLB.textColor = [UIColor blackColor];
    nameLB.text = section?@"医师执业证(正反两面)" : @"身份证照片(正反两面)" ;
    [view addSubview:nameLB];
    
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(view);
        make.left.equalTo(view).offset(20);
        
    }];
    
    return view;
    
}


- (UIView * )creatBottomView{
    
    UIView * backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    UIView * line = [UIView new];
    line.backgroundColor = UICOLORRGB(0xf5f5f5);
    [backgroundView addSubview:line];
    
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:[UIColor cyanColor]];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5 ;
    [button setTitle:@"下一步" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextstep:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(backgroundView);
        make.height.mas_equalTo(@1);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backgroundView.mas_bottom).offset(-10);
        make.centerX.equalTo(backgroundView);
        make.size.mas_equalTo(CGSizeMake(WIDTH*0.7, 40));
    }];
    
    
    
    return backgroundView;
}

- (void)nextstep:(UIButton *)sender{
    
    if (self.nextStep) {
        
        self.nextStep(2);
    }
    
    
}



@end
