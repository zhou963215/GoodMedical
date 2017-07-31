//
//  ProjectPopView.m
//  GoodMedical
//
//  Created by zhou on 2017/7/31.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ProjectPopView.h"
#import "LeftHelper.h"
#import "ProjectScrollView.h"
@interface ProjectPopView ()

@property (nonatomic, strong) LeftHelper * leftTab;
@property (nonatomic, strong) ProjectScrollView * projectScrollView;


@end

@implementation ProjectPopView


- (void)setSubviews{
    
    [super setSubviews];
    
    WEAKSELF(wk);
    NSArray * arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    NSMutableArray * array =[NSMutableArray arrayWithArray:@[@"盗墓笔记",@"空空道人谈股市",@"叶文有话要说",@"相声",@"二货一箩筐",@"单田方",@"城市",@"美女",@"社交恐惧",@"家庭矛盾",@"失恋",@"局势很简单",@"Word",@"美女",@"美女与野兽",@"体育",@"生化危机"]];
    

    _leftTab = [LeftHelper blog];
    
    _leftTab.dataArray = arr;
    [self.popView addSubview:_leftTab.tableView];
    
    _leftTab.selected = ^void(NSInteger index){
        
        wk.projectScrollView.dataArray = array;
        
        
    };

    _projectScrollView = [[ProjectScrollView alloc]init];

    [self.popView addSubview:_projectScrollView];
    
    
    [_leftTab.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wk.totolBar.mas_bottom);
        make.left.bottom.equalTo(wk.popView);
        make.width.mas_equalTo(@100);
        
    }];
    
    
    
    [_projectScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wk.totolBar.mas_bottom);
        make.right.bottom.equalTo(wk.popView);
        make.left.equalTo(wk.leftTab.tableView.mas_right);
        
    }];
    
    
    _projectScrollView.dataArray = array;
    
}

- (void)submitData{
    
    [super submitData];
    
    if (self.selectData && _projectScrollView.lastSelectDict) {
        
        self.selectData(@[_projectScrollView.lastSelectDict]);
        
    }
    [self clickBgViewToHide];
    
    
}

@synthesize historyDict = _historyDict;
- (void)setHistoryDict:(NSDictionary *)historyDict{
    
    _historyDict = historyDict;
    
    _projectScrollView.lastSelectDict = historyDict;
    
    
}

@end
