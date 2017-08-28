//
//  PayOrderTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/5.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "PayOrderTableViewCell.h"

@interface PayOrderTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *successImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *contentLB;

@end

@implementation PayOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];


    _contentLB.text = @"您的订单已提交成功,请选择付费类型进行支付,进行支付后订单才会生效哦! \n\n截止到预约开始前两个小时还未支付订单将自动被取消!";
}






@end
