//
//  PriceDetailCell.h
//  GoodMedical
//
//  Created by zhou on 2017/8/4.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PriceDetailCell : UITableViewCell
@property (nonatomic, assign) BOOL isDetail;
- (void)calculateThePrice;

@end
