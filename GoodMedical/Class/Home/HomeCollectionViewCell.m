//
//  HomeCollectionViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/2.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface HomeCollectionViewCell ()
@property(nonatomic,strong)UILabel * titleLB;
@property(nonatomic,strong)UIImageView * imageView;

@end

@implementation HomeCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setSubview];
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}


- (void)setSubview
{
    
    _titleLB = [UILabel new];
    _titleLB.textColor = UICOLORRGB(0x282828);
    _titleLB.font =[UIFont systemFontOfSize:12];
    [self addSubview:_titleLB];
    
    _imageView  = [UIImageView new];
    _imageView.backgroundColor = [UIColor orangeColor];
    [self addSubview:_imageView];
    
    
    
    WEAKSELF(wk);
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(wk);
        make.top.equalTo(self).offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }] ;
    
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(wk);
        make.top.equalTo(wk.imageView.mas_bottom).offset(5);
        //        make.bottom.equalTo(self).offset(-5);
    }];
    
    
    
}


- (void)setUpDataWithDict:(NSDictionary *)dict{
    
    
    _titleLB.text = dict[@"name"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:dict[@"image"]]];
    
    
    
    
}


@end
