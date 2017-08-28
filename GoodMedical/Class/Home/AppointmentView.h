//
//  AppointmentView.h
//  GoodMedical
//
//  Created by zhou on 2017/8/26.
//  Copyright © 2017年 zhou. All rights reserved.
//


@interface AppointmentView : UIView

@property (nonatomic, strong) UIView * popView;
@property(nonatomic, strong)NSMutableArray * dataArray;
@property(copy,nonatomic)void (^selectData)(NSInteger );

-(instancetype)initAlertViewHeight:(CGFloat)height;
- (void)clickBgViewToHide;


@end
