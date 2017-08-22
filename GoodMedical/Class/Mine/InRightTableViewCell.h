//
//  InRightTableViewCell.h
//  GoodMedical
//
//  Created by zhou on 2017/8/17.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingModel.h"
@interface InRightTableViewCell : UITableViewCell

@property (nonatomic, strong) ShoppingModel * dataModel;

@property (nonatomic, assign) BOOL isSelect;


- (void)setUpDataWithModel:(ShoppingModel *)model;

@end
