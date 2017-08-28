//
//  HeaderTableViewCell.m
//  YCEducation
//
//  Created by zhou on 2017/3/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "HeaderTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation HeaderTableViewCell


- (instancetype)init
{
    self = [super init];
    if (self) {
      
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setSubViews];
    }
    
    return self;
    
}

- (void)setSubViews{
    
    _nameLB = [UILabel new];
    _nameLB.font = [UIFont systemFontOfSize:14];
    _nameLB.textColor = UICOLORRGB(0x777777);
    [self addSubview:_nameLB];
    
    
    
    _header = [UIImageView new];
    _header.layer.masksToBounds = YES;
    _header.layer.cornerRadius = 20;
    _header.backgroundColor = [UIColor redColor];
    [_header sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"m_bg"]];
    [self addSubview:_header];
    
    WEAKSELF(wk);
    
    [self.nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk).offset(20);
        make.centerY.equalTo(wk.mas_centerY);
        make.height.mas_offset(@20);
        make.width.mas_equalTo(@100);
    }];
    
    [_header mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wk).offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.right.equalTo(wk).offset(-32);
        make.bottom.equalTo(wk).offset(-10);
    }];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
