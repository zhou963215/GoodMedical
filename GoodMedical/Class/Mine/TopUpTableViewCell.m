//
//  TopUpTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "TopUpTableViewCell.h"

@interface TopUpTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *contentLB;

@property (weak, nonatomic) IBOutlet UIButton *topUpBtn;
@property (weak, nonatomic) IBOutlet UILabel *promptLB;

@end

@implementation TopUpTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    _topUpBtn.layer.masksToBounds = YES;
    _topUpBtn.layer.cornerRadius = 5;
    _promptLB.text = @"1. 最低充值金额为10元!\n2. 充值成功后请注意微信通知(关注智美好医公众号接收消息提醒) !\n3. 充值金额将自动到您的账户余额,请注意查看";
}
- (IBAction)topUpClick:(id)sender {
}


@end
