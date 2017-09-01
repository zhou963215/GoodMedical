//
//  MembersTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/30.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MembersTableViewCell.h"

@interface MembersTableViewCell ()


@property (weak, nonatomic) IBOutlet UILabel *buyDetailLB;

@end


@implementation MembersTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    _buyBtn.layer.masksToBounds = YES;
    _buyBtn.layer.cornerRadius = 5;
    
    _buyDetailLB.text = @"1. 每月按30天计算,每年按365天计算,购买后即可享受平台开台费全免!\n2. 购买的会员到期后将恢复普通会员,将不再享受任何优惠!\n3. 会员未到期期间可以叠加购买,有效时间将往后积累!";

}







@end
