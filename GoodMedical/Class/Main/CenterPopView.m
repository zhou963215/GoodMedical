//
//  CenterPopView.m
//  GoodMedical
//
//  Created by zhou on 2017/7/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "CenterPopView.h"

@interface CenterPopView ()

{
    
    
    UIButton * center;
    UIButton * left;
    UIButton * right;
    
}

@end

@implementation CenterPopView

-(instancetype)initWithAlertViewHeight:(CGFloat)height
{
    self=[super init];
    if (self) {
        if (self.bGView==nil) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT)];
            view.backgroundColor = [UIColor blackColor];
            view.alpha = 0.4;
            
            self.bGView =view;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBgViewToHide)];
            [self.bGView addGestureRecognizer:tap];
            [self addSubview:self.bGView];
        }
        self.frame = CGRectMake(0,0,WIDTH,HEIGHT);
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
        [self setSubviews];
        
        
        
        [self show:YES];
        
    }
    return self;
}


- (void)setSubviews{
    
    CGFloat centerX = self.center.x;
    
    center = [UIButton buttonWithType:UIButtonTypeCustom];
    center.frame = CGRectMake(centerX-(25 ), HEIGHT-150, 50 , 50 );
    center.tag = 1 ;
    [center setBackgroundColor:[UIColor redColor]];
    [center setImage:[UIImage imageNamed:@"o_1"] forState:UIControlStateNormal];
    [center addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:center];
    
    
    left = [UIButton buttonWithType:UIButtonTypeCustom];
    left.frame = CGRectMake(centerX-(100 ), HEIGHT-110, 50 , 50 );
    left.tag = 2;
    [left setBackgroundColor:[UIColor redColor]];
    [left addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [left setImage:[UIImage imageNamed:@"o_2"] forState:UIControlStateNormal];
    [self addSubview:left];
    
    right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.frame = CGRectMake(centerX+(50) , HEIGHT-110, 50  , 50 );
    right.tag = 3;
    [right setBackgroundColor:[UIColor redColor]];
    [right addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [right setImage:[UIImage imageNamed:@"o_3"] forState:UIControlStateNormal];
    [self addSubview:right];
    
}


-(void)buttonClick:(UIButton*)button
{
    [self hide:YES];
    if (self.ButtonClick) {
        
        self.ButtonClick(button);
        
    }
    
}


- (void)show:(BOOL)animated
{
        if (animated)
        {
            
            center.transform = CGAffineTransformScale(center.transform,0,0);
            left.transform = CGAffineTransformScale(left.transform,0,0);
            right.transform = CGAffineTransformScale(right.transform,0,0);

           //self.transform = CGAffineTransformScale(self.transform,0,0);
//            __weak CenterPopView *weakSelf = self;
            
            [UIView animateWithDuration:.3 animations:^{
                
                center.transform = CGAffineTransformScale(center.transform,1.2,1.2);
                left.transform = CGAffineTransformScale(left.transform,1.2,1.2);
                right.transform = CGAffineTransformScale(right.transform,1.2,1.2);

                
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:.3 animations:^{
//                    weakSelf.transform = CGAffineTransformIdentity;
                    
                    center.transform = CGAffineTransformIdentity;
                    left.transform = CGAffineTransformIdentity;
                    right.transform = CGAffineTransformIdentity;
                }];
            }];
        }
}

- (void)clickBgViewToHide{
    
    [self hide:YES];
    
}
- (void)hide:(BOOL)animated
{
    [self endEditing:YES];
    if (self.bGView != nil) {
       
        
                [UIView animateWithDuration:animated ?0.3: 0 animations:^{
                    
                    center.transform = CGAffineTransformScale(center.transform,1,1);
                    left.transform = CGAffineTransformScale(left.transform,1,1);
                    right.transform = CGAffineTransformScale(right.transform,1,1);

                } completion:^(BOOL finished) {
                    [UIView animateWithDuration: animated ?0.3: 0 animations:^{
                        center.transform = CGAffineTransformScale(center.transform,0.2,0.2);
                        left.transform = CGAffineTransformScale(left.transform,0.2,0.2);
                        right.transform = CGAffineTransformScale(right.transform,0.2,0.2);
                        
                    } completion:^(BOOL finished) {
                        [self.bGView removeFromSuperview];
                        [self removeFromSuperview];
                        self.bGView=nil;
                    }];
                }];
    }
    
}


@end
