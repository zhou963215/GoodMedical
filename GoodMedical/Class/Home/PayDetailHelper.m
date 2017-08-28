//
//  PayDetailHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/24.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "PayDetailHelper.h"
#import "InputTableViewCell.h"
#import "PayOrderTableViewCell.h"
@interface PayDetailHelper ()

@property (nonatomic, strong) PayOrderTableViewCell * payCell;

@property (nonatomic, strong) InputTableViewCell * codeCell;
@property (nonatomic, strong) InputTableViewCell * timeCell;
@property (nonatomic, strong) InputTableViewCell * adressCell;
@property (nonatomic, strong) InputTableViewCell * typeCell;
@property (nonatomic, strong) InputTableViewCell * priceCell;


@property (nonatomic, strong) NSArray * rows;

@end

@implementation PayDetailHelper


+(instancetype)blog{
    
    return [[PayDetailHelper alloc]init];
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
        [self.tableView registerNib:[UINib nibWithNibName:@"MineTableViewCell" bundle:nil] forCellReuseIdentifier:@"mine"];
        self.tableView.tableFooterView = [self creatBottomView];
        
        self.rows = @[self.payCell,self.codeCell,self.timeCell,self.adressCell,self.typeCell,self.priceCell];
        
        
        [_tableView scrollToTop];
        
    }
    
    return self;
    
    
}


- (void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    
    
    [self.tableView reloadData];
    
}



#pragma mark  tableview代理方法


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return _rows.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return _rows[indexPath.row];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
   
    
    
}

- (PayOrderTableViewCell *)payCell{
    
    if (!_payCell) {
       
        _payCell = [[[NSBundle mainBundle]loadNibNamed:@"PayOrderTableViewCell" owner:self options:nil]firstObject];
    }

    return _payCell;
}



- (InputTableViewCell *)codeCell{
    
    if (!_codeCell) {
        
        _codeCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"" title:@"订单号码"];
        _codeCell.inupt.enabled = NO;
        [_codeCell editStyle:NO];
    }
    return _codeCell;
}

- (InputTableViewCell *)timeCell{
    
    if (!_timeCell) {
        
        _timeCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"" title:@"预约时间"];
        _timeCell.inupt.enabled = NO;
        [_timeCell editStyle:NO];
    }
    return _timeCell;
}

- (InputTableViewCell *)adressCell{
    
    if (!_adressCell) {
        
        _adressCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"" title:@"预约地点"];
        _adressCell.inupt.enabled = NO;
        [_adressCell editStyle:NO];
    }
    return _adressCell;
}


- (InputTableViewCell *)typeCell{
    
    if (!_typeCell) {
        
        _typeCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"" title:@"手术项目"];
        _typeCell.inupt.enabled = NO;
        [_typeCell editStyle:NO];
    }
    return _typeCell;
}

- (InputTableViewCell *)priceCell{
    
    if (!_priceCell) {
        
        _priceCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"" title:@"订单费用"];
        _priceCell.inupt.enabled = NO;
        _priceCell.inupt.text = @"198";

        [_priceCell editStyle:NO];
    }
    return _priceCell;
}
- (UIView * )creatBottomView{
    
    UIView * backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:[UIColor cyanColor]];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5 ;
    [button setTitle:@"立即微信支付" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextstep:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(backgroundView);
        make.size.mas_equalTo(CGSizeMake(WIDTH*0.7, 40));
    }];
    
    
    
    return backgroundView;
}

- (void)nextstep:(UIButton *)sender{
    
    
    [self callActionSheet];
    
    
}

- (void)callActionSheet{
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"支付方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"全款支付" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
//        [self callImagePickerControllerWithIndex:0];
        
    }];
    UIAlertAction *phone = [UIAlertAction actionWithTitle:@"订金支付" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
//        [self callImagePickerControllerWithIndex:1];
        
    }];
    UIAlertAction * cance = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
        
    }];
    [alert addAction:cance];
    [alert addAction:confirmAction];
    [alert addAction:phone];
    [self.tableView.navigationController presentViewController:alert animated:YES completion:nil];
    
    
    
}

@end
