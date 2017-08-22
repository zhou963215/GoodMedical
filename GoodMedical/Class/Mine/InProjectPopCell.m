//
//  ProjectPopCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/18.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "InProjectPopCell.h"
#import "ProjectInView.h"
#import "TotalPriceModel.h"

@interface InProjectPopCell ()
@property(nonatomic,retain) UIView * line;

@end

@implementation InProjectPopCell

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
    
    ProjectInView * inView = [[ProjectInView alloc]initAlertViewHeight:400];    
    
    TotalPriceModel * total = [TotalPriceModel dataModel];
    [total.shopChangeArray removeAllObjects];
    
    if (total.shopArray.count > 0) {
        
        total.shopChangeArray = [total.shopArray mutableCopy];
    }

    
    inView.selectData =  ^void(NSArray * data){
        
        
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
    self.line = [[UIView alloc]init];
    self.line.backgroundColor = UICOLORRGB(0xe8e7e7);
    [self addSubview:self.line];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk).offset(10);
        make.right.equalTo(wk).offset(-10);
        make.height.mas_equalTo(@0.5);
        make.bottom.mas_equalTo(wk.mas_bottom);
        
    }];

}



@end
