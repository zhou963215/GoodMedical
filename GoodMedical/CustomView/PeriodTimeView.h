//
//  PeriodTimeView.h
//  GoodMedical
//
//  Created by zhou on 2017/7/31.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeriodTimeView : UIView

@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic ,copy)void(^selectDateBlock)(NSInteger,NSInteger,BOOL);


- (void)selectDateOfMonth:(void(^)(NSInteger star,NSInteger end,BOOL isSuccess))selectBlock;

@end
