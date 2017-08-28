//
//  DoctorSelectTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "DoctorSelectTableViewCell.h"

@interface DoctorSelectTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLB;

@end
@implementation DoctorSelectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)upDataWiheDict:(NSDictionary *)dict{
    
    
    self.nameLB.text = dict[@"name"];
}

@end
