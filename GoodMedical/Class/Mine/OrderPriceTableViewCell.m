//
//  OrderPriceTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/29.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "OrderPriceTableViewCell.h"

@interface OrderPriceTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *timePriceLB;

@property (weak, nonatomic) IBOutlet UILabel *foundingPriceLB;
@property (weak, nonatomic) IBOutlet UILabel *consumptionPriceLB;

@property (weak, nonatomic) IBOutlet UILabel *priceLB;
@end

@implementation OrderPriceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
