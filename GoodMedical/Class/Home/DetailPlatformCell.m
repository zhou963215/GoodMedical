//
//  DetailPlatformCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/3.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "DetailPlatformCell.h"


@interface DetailPlatformCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UILabel *priceLB;
@property (weak, nonatomic) IBOutlet UILabel *numberLB;

@end


@implementation DetailPlatformCell

- (void)awakeFromNib {
    [super awakeFromNib];
  
    self.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);

    
}


- (void)setUpWithShoppingModel:(ShoppingModel *)model{
    
    
    _nameLB.text = model.name;
    _priceLB.text = [NSString stringWithFormat:@"¥%.2f",model.price];
    _numberLB.text = [NSString stringWithFormat:@"%d",model.buyNumber];
    
}



@end
