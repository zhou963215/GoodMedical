//
//  ProjectInView.m
//  GoodMedical
//
//  Created by zhou on 2017/8/17.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ProjectInView.h"
#import "LeftHelper.h"
#import "InRightHelper.h"
#import "ShoppingModel.h"
#import "TotalPriceModel.h"
@interface ProjectInView ()

@property (nonatomic, strong) LeftHelper * leftTab;
@property (nonatomic, strong) InRightHelper * rightTab;
@end

@implementation ProjectInView


- (void)setSubviews{
    
    [super setSubviews];
    
    
    NSArray * arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];

    _leftTab = [LeftHelper blog];
    
    _leftTab.dataArray = arr;
    [self.popView addSubview:_leftTab.tableView];
    _leftTab.selected = ^void(NSInteger index){
        
//        wk.projectScrollView.dataArray = array;
        
        
    };
    
    _rightTab = [InRightHelper blog];
    _rightTab.dataArray = [self creatTsetData];
    [self.popView addSubview:_rightTab.tableView];

    WEAKSELF(wk);
    [_leftTab.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wk.totolBar.mas_bottom);
        make.left.bottom.equalTo(wk.popView);
        make.width.mas_equalTo(@100);
        
    }];
    
    
    
    [_rightTab.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wk.totolBar.mas_bottom);
        make.right.bottom.equalTo(wk.popView);
        make.left.equalTo(wk.leftTab.tableView.mas_right);
        
    }];
    


    
}

- (void)submitData{
    
    [super submitData];
    [self endEditing:YES];
    
    NSMutableArray * array = [NSMutableArray array];
    
    TotalPriceModel * total = [TotalPriceModel dataModel];
//    NSMutableArray * copyArray = [total.shopArray mutableCopy];
//    
//    int i  = 0;
//    ShoppingModel * inModel;
//    
//    for (ShoppingModel * shop  in _rightTab.selectArray) {
//        
//        for (ShoppingModel * select in copyArray) {
//            
//            if ([shop.name isEqualToString:select.name]) {
//                
//                if (shop.isRemove) {
//                    
//                    [total.shopArray removeObject:select];
//                    
//                }
//                
//            }else{
//                i++;
//                if (i == copyArray.count) {
//                    inModel = select;
//                }
//            }
//        }
//        
//        
//        if (i == copyArray.count && !shop.isRemove) {
//            
//             [total.shopArray addObject:shop];
//            
//        }
//        
//        i = 0;
//        inModel = nil;
//        
//    }
//    
//
    if (total.shopChangeArray.count>0) {
        
        
        for (ShoppingModel * model in total.shopChangeArray) {
            
            NSLog(@"%@",model.inPrice);
            
            if (!model.isPrice) {
                
                [ZHHud initWithMessage:@"请输入项目价格"];
                
                return;
            }
            
        }
        
    }
    
    total.shopArray = [total.shopChangeArray mutableCopy];
    
    
    if (self.selectData ) {
        
        self.selectData(array);
        
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
        model.inPrice = @"";
        model.buyNumber = 0;
        
        [array addObject:model];
        
    }
    
    
    
    return array;
}



@end
