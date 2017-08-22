//
//  ShoppingView.m
//  GoodMedical
//
//  Created by zhou on 2017/8/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ShoppingView.h"
#import "LeftHelper.h"
#import "ShoppingHelper.h"
#import "ShoppingModel.h"
#import "TotalPriceModel.h"
@interface ShoppingView ()

@property (nonatomic, strong) LeftHelper * leftTab;
@property (nonatomic, strong) ShoppingHelper * shop;


@end
@implementation ShoppingView

- (void)setSubviews{
    
    [super setSubviews];
    
    WEAKSELF(wk);
    NSArray * arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];

    
    
    
    _leftTab = [LeftHelper blog];
    
    _leftTab.dataArray = arr;
    [self.popView addSubview:_leftTab.tableView];
    
    _leftTab.selected = ^void(NSInteger index){
        
//        wk.projectScrollView.dataArray = array;
//        wk.shop.dataArray = array;
        
    };
    
    _shop = [ShoppingHelper blog];
    _shop.dataArray = [self creatTsetData];
    [self.popView addSubview:_shop.tableView];
    
    
    [_leftTab.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wk.totolBar.mas_bottom);
        make.left.bottom.equalTo(wk.popView);
        make.width.mas_equalTo(@100);
        
    }];
    
    
    
    [_shop.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wk.totolBar.mas_bottom);
        make.right.bottom.equalTo(wk.popView);
        make.left.equalTo(wk.leftTab.tableView.mas_right);
        
    }];
    
    
    
}

- (void)submitData{
    
    [super submitData];
    
    TotalPriceModel * total = [TotalPriceModel dataModel];
    
    total.shopArray = [total.shopChangeArray mutableCopy];
    [total.shopChangeArray removeAllObjects];
    
    
    if (self.selectData) {
        
        self.selectData(@[]);
        
    }
    [self clickBgViewToHide];
    
    
}



- (NSMutableArray *)creatTsetData{
    
    NSMutableArray * array = [NSMutableArray array];
    NSArray * nameArray  = @[@"鲁班",@"凯",@"狄仁杰",@"韩信",@"李元芳"];
    for (int i = 0; i < 5;  i ++) {
        
        ShoppingModel * model = [[ShoppingModel alloc]init];
        model.name = nameArray[i];
        model.pictureUrl = @"http://picture.youth.cn/dmzb/201305/W020130514542662922703.jpg";
        model.lastNumber = @"1000";
        model.price = 2000.00+i;
        model.buyNumber = 0;
        
        [array addObject:model];
        
    }
    
    
    
    return array;
}



@end
