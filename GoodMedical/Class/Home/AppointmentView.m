//
//  AppointmentView.m
//  GoodMedical
//
//  Created by zhou on 2017/8/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AppointmentView.h"
#import "DoctorSelectTableViewCell.h"
@interface AppointmentView ()<UITableViewDelegate,UITableViewDataSource>
{
    
    CGFloat topHeight;
    
}

@property(nonatomic, strong) UIView * bGView;
@property (nonatomic ,strong) UITableView * tableView;


@end

@implementation AppointmentView



+(instancetype)sharePop:(CGFloat)height{
    
    
    return [[AppointmentView alloc]initAlertViewHeight:height];
}

-(instancetype)initAlertViewHeight:(CGFloat)height{
    
    self=[super init];
    if (self) {
        
        topHeight = height;
        
        [self addSubview:self.bGView];
        [self addSubview:self.tableView];
        self.frame = CGRectMake(0,0,WIDTH,HEIGHT);
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
        
        [self show:YES];
        
        
    }
    return self;
}


- (void)setSubviews{
    
    
    
    
    
    
    
    
}


- (void)show:(BOOL)animated
{
    if (animated)
    {
        CGFloat top_y = HEIGHT-topHeight;
        
        
        [UIView animateWithDuration:.3 animations:^{
            
            self.tableView.frame = CGRectMake(0, top_y, WIDTH, topHeight);
            
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)clickBgViewToHide{
    
    
    
    [self hide:YES];
    
}
- (void)hide:(BOOL)animated
{
    [self endEditing:YES];
    
    if (self.bGView != nil) {
        
        [UIView animateWithDuration:animated ?0.3: 0 animations:^{
            
            self.tableView.frame = CGRectMake(0, HEIGHT, WIDTH, topHeight);
            
        } completion:^(BOOL finished) {
            
            //            [self.bGView removeFromSuperview];
            [self removeFromSuperview];
            //            self.bGView=nil;
            
        }];
    }
    
}
#pragma mark=====


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    DoctorSelectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"doctor"];
    
    [cell upDataWiheDict:_dataArray[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.selectData) {
        
        self.selectData(indexPath.row);
        [self hide:YES];
    }
    
}


#pragma CREAT


- (UIView *)bGView{
    
    if (!_bGView) {
        
        _bGView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _bGView.backgroundColor = [UIColor blackColor];
        _bGView.alpha = 0.4 ;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBgViewToHide)];
        [_bGView addGestureRecognizer:tap];
    }
    
    
    return _bGView;
}

- (UIView *)popView{
    
    if (!_popView) {
        
        _popView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-44, WIDTH, topHeight)];
        _popView.backgroundColor = [UIColor whiteColor];
        
    }
    
    
    return _popView;
}


- (UITableView *)tableView{
    
    if (!_tableView) {
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, HEIGHT, WIDTH, topHeight) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44;
        [self.tableView registerNib:[UINib nibWithNibName:@"DoctorSelectTableViewCell" bundle:nil] forCellReuseIdentifier:@"doctor"];
        self.tableView.tableFooterView = [UIView new];
    }
    
    return _tableView;
}




@end
