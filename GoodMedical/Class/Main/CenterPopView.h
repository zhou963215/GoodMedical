//
//  CenterPopView.h
//  GoodMedical
//
//  Created by zhou on 2017/7/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CenterPopView : UIView
@property(nonatomic,strong)UIView *bGView;
@property(nonatomic,strong)UIView * popView;
@property(nonatomic,assign)int type;
@property(copy,nonatomic)void (^ButtonClick)(UIButton*);
@property(nonatomic,assign) int select;

-(instancetype)initWithAlertViewHeight:(CGFloat)height;

- (void)show:(BOOL)animated;

- (void)hide:(BOOL)animated;

@end
