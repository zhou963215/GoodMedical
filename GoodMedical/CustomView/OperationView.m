//
//  OperationView.m
//  GoodMedical
//
//  Created by zhou on 2017/7/29.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "OperationView.h"
#import "LeftHelper.h"
#import "ClassificationHelper.h"

@interface OperationView ()

@property(nonatomic, strong) LeftHelper * leftTab;
@property(nonatomic, strong) ClassificationHelper * rightTab;

@end
@implementation OperationView



- (void)setSubviews{
    
    [super setSubviews];
    
    WEAKSELF(wk);
    NSArray * arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    NSMutableArray * array  = [NSMutableArray arrayWithArray:arr];
    
    
    _leftTab = [LeftHelper blog];
    _rightTab = [ClassificationHelper blog];
    
    
    [self.popView addSubview:_leftTab.tableView];
    [self.popView addSubview:_rightTab.tableView];
    
    _leftTab.selected = ^void(NSInteger index){
        
        
        [array addObject:[NSString stringWithFormat:@"%ld",(long)index]];
        
        wk.rightTab.dataArray = array;
        
    };
    _leftTab.dataArray = arr;
    
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
    
        if (self.selectData &&_rightTab.lastSelectDict) {
    
        self.selectData(@[_rightTab.lastSelectDict]);
            
        }
        [self clickBgViewToHide];
    
    
}
@synthesize historyDict = _historyDict;

- (void)setHistoryDict:(NSDictionary *)historyDict{
    
    
    _historyDict = historyDict;
    
    _rightTab.lastSelectDict = historyDict;
    
    
}


@end
