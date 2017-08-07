//
//  TotalPriceModel.h
//  GoodMedical
//
//  Created by zhou on 2017/8/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TotalPriceModel : NSObject

@property (nonatomic, strong) NSMutableArray * shopArray;
@property (nonatomic, copy) NSString * starCode;
@property (nonatomic, copy) NSString * endCode;
@property (nonatomic, assign) BOOL isSuccess;


@property (nonatomic, assign) CGFloat projectPrice;
@property (nonatomic, assign) CGFloat timePrice;
@property (nonatomic, assign) CGFloat shopPrice;
@property (nonatomic, copy) NSString * dateString;
+ (TotalPriceModel *)dataModel;
- (void)reductionZero;
- (void)backZero;

- (NSString * )defaultDate;
@end
