//
//  ShoppingTableViewCell.h
//  GoodMedical
//
//  Created by zhou on 2017/8/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingModel.h"
@interface ShoppingTableViewCell : UITableViewCell

- (void)setUpDataWithModel:(ShoppingModel *)model;
@end
