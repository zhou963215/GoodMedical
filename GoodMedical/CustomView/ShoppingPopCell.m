//
//  ShoppingPopCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ShoppingPopCell.h"
#import "ShoppingView.h"
#import "TotalPriceModel.h"
#import "ShoppingModel.h"
@implementation ShoppingPopCell


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

    ShoppingView * shop = [[ShoppingView alloc]initAlertViewHeight:400];
    TotalPriceModel * total = [TotalPriceModel dataModel];
    
    if (total.shopArray.count > 0) {
        
        shop.selectArray = total.shopArray;
        
    }
    
       
    shop.selectData =  ^void(NSArray * data){
        
        
        NSMutableArray * array = [NSMutableArray arrayWithArray:data];
        total.shopArray = array;
        UITableView * tab = (UITableView *)self.superview.superview;
        [tab reloadData];
        NSLog(@"-----%@",data);
        
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
