//
//  PeriodCollectionViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/7/31.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "PeriodCollectionViewCell.h"

@interface PeriodCollectionViewCell()

@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UILabel * priceLabel;

@end

@implementation PeriodCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setSubview];
//        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}


- (void)setSubview{
    
    WEAKSELF(wk);
    
    _timeLabel = [UILabel new];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = [UIColor blackColor];
    [self addSubview:_timeLabel];
    
    
    _priceLabel = [UILabel new];
    _priceLabel.font = [UIFont systemFontOfSize:12];
    _priceLabel.textColor = UICOLORRGB(0x282828);
    [self addSubview:_priceLabel];
    
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(wk.mas_centerY).offset(-10);
        make.centerX.equalTo(wk);
        
        
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(wk.mas_centerY).offset(10);
        make.centerX.equalTo(wk);
        
    }];
    

}

-(void)setUpDataWithNSDictionary:(NSDictionary *)dict{
    
    
    _timeLabel.text = dict[@"time"];
    _priceLabel.text = dict[@"price"];
    
}



@end
