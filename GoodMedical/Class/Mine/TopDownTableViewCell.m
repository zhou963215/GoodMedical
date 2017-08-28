//
//  TopDownTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "TopDownTableViewCell.h"

@interface TopDownTableViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *topDownBtn;

@property (weak, nonatomic) IBOutlet UILabel *contentLB;


@end

@implementation TopDownTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];


    _topDownBtn.layer.masksToBounds = YES;
    _topDownBtn.layer.cornerRadius = 5;

    

    _contentLB.text = @"1. 最低提现金额为1.04\n2. 提现申请提交成功后请注意微信通知,到账时间为一个工作日!(关注智美好医公众号接收消息提醒)!\n3. 提现金额将自动到账您的微信零钱,请注意查看!";
    
    
    


}

- (IBAction)topDownClick:(id)sender {
    
    
    
}


@end
