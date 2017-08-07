//
//  ProjectPopCell.m
//  GoodMedical
//
//  Created by zhou on 2017/7/31.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ProjectPopCell.h"
#import "ProjectPopView.h"
#import "TotalPriceModel.h"
@implementation ProjectPopCell

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

    ProjectPopView * op = [[ProjectPopView alloc]initAlertViewHeight:300];
    
    if (self.label.text.length > 0) {
        
        NSDictionary * dict = @{@"name":self.label.text};
        
        op.historyDict = dict;
    }
    op.selectData =  ^void(NSArray * data){
        
        NSDictionary * dict = data[0];
        
        self.label.text = dict[@"name"];
        self.values = @[dict[@"name"]];
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
