//
//  BasePopView.h
//  GoodMedical
//
//  Created by zhou on 2017/7/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasePopView : UIView

@property (nonatomic, strong) UIView * popView;
@property (nonatomic, strong) UIView * totolBar;
@property (nonatomic, copy) NSDictionary * historyDict;

@property(nonatomic, strong)NSMutableArray * dataArray;
@property(copy,nonatomic)void (^selectData)(NSArray *);

//+(instancetype)sharePop:(CGFloat)height;
-(instancetype)initAlertViewHeight:(CGFloat)height;
- (void)setSubviews;
- (void)submitData;
- (void)clickBgViewToHide;
@end
