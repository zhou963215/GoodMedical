//
//  OperationProjectCell.h
//  GoodMedical
//
//  Created by zhou on 2017/7/29.
//  Copyright © 2017年 zhou. All rights reserved.
//
//项目选择
#import <UIKit/UIKit.h>
#import "ZHFormActionCell.h"

@interface OperationProjectCell : ZHFormActionCell
@property(nonatomic, retain) UILabel * nameLB;
- (instancetype)initWithTitle:(NSString * )title;
@end
