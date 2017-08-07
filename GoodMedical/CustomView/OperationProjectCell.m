//
//  OperationProjectCell.m
//  GoodMedical
//
//  Created by zhou on 2017/7/29.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "OperationProjectCell.h"
#import "OperationView.h"
#import "TotalPriceModel.h"
@interface OperationProjectCell ()


@end

@implementation OperationProjectCell

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

    OperationView * op = [[OperationView alloc]initAlertViewHeight:300];
    if (self.label.text.length > 0) {
        
        op.historyDict = @{@"name":self.label.text};
        
    }
    op.selectData =  ^void(NSArray * data){
        
        NSDictionary * dict = data[0];
        
        self.label.text = dict[@"name"];
        self.values = @[dict[@"name"]];
        [TotalPriceModel dataModel].projectPrice = 100;
        
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
