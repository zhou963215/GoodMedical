//
//  TotalPriceModel.m
//  GoodMedical
//
//  Created by zhou on 2017/8/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "TotalPriceModel.h"
#import "ShoppingModel.h"
@implementation TotalPriceModel


+ (TotalPriceModel *)dataModel
{
    static TotalPriceModel * dataModel = nil;
    
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        dataModel = [[self alloc] init];
        dataModel.shopArray = [NSMutableArray array];
    });
    return dataModel;
    
}


- (void)setShopArray:(NSMutableArray *)shopArray{
    
    _shopArray = shopArray;
    self.shopPrice = 0;
    
    for (ShoppingModel * model in _shopArray) {
        
        CGFloat prcie = model.price * model.buyNumber;
        self.shopPrice +=prcie;
        
        
    }
    
    
    
}
- (void)reductionZero{
    
    self.isSuccess = NO;
    self.starCode = @"";
    self.endCode = @"";
    self.projectPrice = 0;
    self.timePrice = 0;
    self.shopPrice = 0;
    [self.shopArray removeAllObjects];
    self.dateString = [self defaultDate];
    
}
- (void)backZero{
    
    self.projectPrice = 0;
    self.shopPrice = 0;

    [self.shopArray removeAllObjects];

    
}

- (NSString * )defaultDate{
    
    
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    return [formatter stringFromDate:date];
    
    
}
@end
