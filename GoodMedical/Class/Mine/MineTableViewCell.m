//
//  MineTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/15.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MineTableViewCell.h"

@interface MineTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UILabel *detailLB;

@end

@implementation MineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
    
}


- (void)upDataWithDict:(NSDictionary *)dict{
    
    self.nameLB.text = dict[@"name"];
    self.detailLB.text = dict[@"detail"];
    
    
    
}

@end
