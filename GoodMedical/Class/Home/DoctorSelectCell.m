//
//  DoctorSelectCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "DoctorSelectCell.h"
#import "AppointmentView.h"
@implementation DoctorSelectCell


- (instancetype)init {
    self = [super init];
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [self setSubviews];
    return self;
}

- (instancetype)initWithTitle:(NSString * )title{
    
    self = [self init];
    if (self) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        CGPoint  point = self.fieldView.center;
        
        point.x = point.x-10;
        
        self.fieldView.center = point;
        self.nameLB.text = title;
        
    }
    
    
    return self;
}

- (void)doAction{
    
    if (self.disabled) {
        return;
    }
    
    UIView *superView = self.superview;
    while(![superView isMemberOfClass:[UITableView class]]){
        superView = superView.superview;
    }
    [superView endEditing:YES];
    
    NSArray * arr = @[@{@"name":@"张三"},@{@"name":@"李四"},@{@"name":@"王麻子"}];
    
    AppointmentView * shop = [[AppointmentView alloc]initAlertViewHeight:200];
    shop.dataArray = [NSMutableArray arrayWithArray:arr];
    
    shop.selectData =  ^void(NSInteger  count){
        
        self.label.text = arr[count][@"name"];
        
    };
    
    
}

- (void)setSubviews{
    
    WEAKSELF(wk);
    
    self.nameLB = [UILabel new];
    self.nameLB.font = [UIFont systemFontOfSize:14];
    self.nameLB.textColor = UICOLORRGB(0x777777);
    self.nameLB.text = @"分类";
    [self addSubview:self.nameLB];
    
    [self.nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk).offset(20);
        make.centerY.equalTo(wk.mas_centerY);
        make.height.mas_offset(@20);
    }];
    
    self.label.font = [UIFont systemFontOfSize:14];
}







@end
