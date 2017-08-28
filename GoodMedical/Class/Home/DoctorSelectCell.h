//
//  DoctorSelectCell.h
//  GoodMedical
//
//  Created by zhou on 2017/8/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ZHFormActionCell.h"

@interface DoctorSelectCell : ZHFormActionCell
@property(nonatomic, retain) UILabel * nameLB;
- (instancetype)initWithTitle:(NSString * )title;

@end
