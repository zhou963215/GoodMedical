//
//  TopCertificationView.h
//  GoodMedical
//
//  Created by zhou on 2017/8/16.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TINTCOLOR [UIColor colorWithRed:35/255.f green:135/255.f blue:255/255.f alpha:1]

@interface TopCertificationView : UIView

@property (nonatomic, retain)NSArray * _Nonnull titles;

@property (nonatomic, assign)int stepIndex;

- (instancetype _Nonnull )initWithFrame:(CGRect)frame Titles:(nonnull NSArray *)titles;

- (void)setStepIndex:(int)stepIndex Animation:(BOOL)animation;
@end
