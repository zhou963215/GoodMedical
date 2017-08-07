//
//  CalendarTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/2.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "CalendarTableViewCell.h"
#import "BSLCalendar.h"
#import "PeriodTimeView.h"
#import "TotalPriceModel.h"
@interface CalendarTableViewCell ()

@property (nonatomic, strong) BSLCalendar * calender;
@property (nonatomic, strong) PeriodTimeView * period;

@property (nonatomic, strong) TotalPriceModel * total;

@end
@implementation CalendarTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setSubviews];
        self.total = [TotalPriceModel dataModel];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
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
    
    _period = [PeriodTimeView new];
    _period.dataArray = [self creatTestData];
    [_period selectDateOfMonth:^(NSInteger star, NSInteger end,BOOL isSuccess) {
        
        wk.total.isSuccess = isSuccess;
        if (star!=1001) {
            wk.total.starCode = wk.period.dataArray[star][@"time"];

        }if (end !=1002) {
            wk.total.endCode = wk.period.dataArray[end][@"time"];
  
        }
        
        if (isSuccess) {
            
            [wk calculateThePriceWithStar:star end:end];
        }
        NSLog(@"开始---%ld----结束--%ld",star,end);
        
    }];
    [self addSubview:_period];
    

    [_calender mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.equalTo (wk);
        make.height.mas_equalTo (@300);
        
        
    }];
    
    [_period mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wk.calender.mas_bottom).offset (10);
        make.left.right.equalTo(wk);
        make.height.mas_equalTo(@345);
        make.bottom.equalTo(wk.mas_bottom);
    }];
    
}




- (void )calculateThePriceWithStar:(NSInteger)star end:(NSInteger)end{
    
    CGFloat price = 0.00;
    
    for (int i = 0; i < _period.dataArray.count; i ++) {
        
        if ((i>star && i < end ) || i == star || i == end) {
            
            NSDictionary * dict = _period.dataArray[i];
            
            CGFloat timePrice = [dict[@"price"]floatValue]/2;
            price +=timePrice;
            
        }
        
        
    }
    NSLog(@"%f",price);
    _total.timePrice = price;
   
}

- (NSMutableArray *)creatTestData{
    
    NSMutableArray * array = [NSMutableArray array];
    
    for (int i = 0; i < 24 ; i++) {
        
        NSDictionary * dict = @{@"time":@"10:00",@"price" : @"200"};
        
        [array addObject:dict];
        
        
    }
    return array;
    
}


@end
