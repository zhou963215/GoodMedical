//
//  ConsumablesTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/29.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ConsumablesTableViewCell.h"

@interface ConsumablesTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLB;

@property (weak, nonatomic) IBOutlet UILabel *priceLB;

@property (weak, nonatomic) IBOutlet UILabel *numberLB;



@end

@implementation ConsumablesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
