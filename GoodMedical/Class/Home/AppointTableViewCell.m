//
//  AppointTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AppointTableViewCell.h"
#import "BSLCalendar.h"
#import "TotalPriceModel.h"


@interface AppointTableViewCell ()

@property (nonatomic, strong) TotalPriceModel * total;

@property (nonatomic, strong) BSLCalendar * calender;


@end

@implementation AppointTableViewCell

- (instancetype)init{
    
    self = [super init];
    if (self) {
        self.total = [TotalPriceModel dataModel];
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        [self setSubviews];
        
    }
    
    return self;
}
- (void)setSubviews{
    
    WEAKSELF(wk)
    
    
    
    
    _calender = [BSLCalendar new];
    _calender.showChineseCalendar = NO;
    [self addSubview:_calender];
    [_calender selectDateOfMonth:^(NSInteger year, NSInteger month, NSInteger day) {
        
        wk.total.dateString = [NSString stringWithFormat:@"%ld年-%ld月-%ld日",(long)year,(long)month,(long)day];
        NSLog(@"%ld年/%ld月/%ld日",(long)year,(long)month,(long)day);
    }];
    
   
    
    
    [_calender mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.equalTo (wk);
        make.height.mas_equalTo (@300);
        make.bottom.equalTo(wk).offset(-10);
        
    }];
    
   
    
}




@end
