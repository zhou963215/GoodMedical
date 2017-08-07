//
//  PriceDetailTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/4.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "PriceDetailTableViewCell.h"
#import "TotalPriceModel.h"

@interface PriceDetailTableViewCell ()

@property (nonatomic, strong) UILabel * nameLB;
@property (nonatomic, strong) UILabel * priceLB;

@property (nonatomic, strong) UILabel * timePriceLB;
@property (nonatomic, strong) UILabel * projectPriceLB;
@property (nonatomic, strong) UILabel * shopPriceLB;
@property (nonatomic, strong)  UIView  * line;


@end

@implementation PriceDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setSuviews];
    }
    
    return self;
    
    
}



- (void)setSuviews{
    
    _nameLB = [UILabel new];
    _nameLB.text = @"总费用";
    _nameLB.textColor = UICOLORRGB(0x777777);
    _nameLB.font = [UIFont systemFontOfSize:14];
    [self addSubview:_nameLB];
    
    _priceLB = [UILabel new];
    _priceLB.font = [UIFont systemFontOfSize:14];
    _priceLB.textColor = [UIColor cyanColor];
    _priceLB.text = @"¥100";
    [self addSubview:_priceLB];
    
    UIImageView * rightView = [UIImageView new];
    rightView.image = [UIImage imageNamed:@"right"];
    [self addSubview:rightView];
    
    
    _line = [UIView new];
    _line.backgroundColor = UICOLORRGB(0xe8e7e7);
    [self addSubview:_line];
    
    _timePriceLB = [UILabel new];
    _timePriceLB.font = [UIFont systemFontOfSize:12];
    _timePriceLB.textColor = [UIColor lightGrayColor];
    [self addSubview:_timePriceLB];
    
    _projectPriceLB = [UILabel new];
    _projectPriceLB.font = [UIFont systemFontOfSize:12];
    _projectPriceLB.textColor = [UIColor lightGrayColor];
    [self addSubview:_projectPriceLB];
    
    _shopPriceLB = [UILabel new];
    _shopPriceLB.font = [UIFont systemFontOfSize:12];
    _shopPriceLB.textColor = [UIColor lightGrayColor];
    [self addSubview:_shopPriceLB];

    
    WEAKSELF(wk);
    
    
    [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk).offset(20);
        make.top.equalTo (wk).offset(12);
        make.height.mas_equalTo(@20);
    }];
    
    [_priceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(wk).offset(-30);
        make.centerY.equalTo(wk.nameLB);
        
        
    }];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(wk.nameLB);
        make.size.mas_equalTo(CGSizeMake(8, 13));
        make.right.equalTo(wk).offset(-15);
        
        
    }];
    
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(wk);
        make.top.equalTo(wk.nameLB.mas_bottom).offset(11);
        make.height.mas_equalTo(@1);
        
    }];
    
    
    [_timePriceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.right.equalTo(wk.priceLB);
        make.height.mas_equalTo(@25);
        make.top.equalTo(wk.line.mas_bottom);

    }];
    
    [_projectPriceLB mas_makeConstraints:^(MASConstraintMaker *make) {

        make.right.equalTo(wk.priceLB);
        make.top.equalTo(wk.timePriceLB.mas_bottom);
        make.height.mas_equalTo(@25);

        
    }];
    
    [_shopPriceLB mas_makeConstraints:^(MASConstraintMaker *make) {

        make.right.equalTo(wk.priceLB);
        make.top.equalTo(wk.projectPriceLB.mas_bottom);
        make.height.mas_equalTo(@25);

    }];
    
    
}


- (void)calculateThePrice{
    
    TotalPriceModel * total = [TotalPriceModel dataModel];
    CGFloat price = total.timePrice + total.shopPrice + total.projectPrice;
    
    _priceLB.text = [NSString stringWithFormat:@"¥%.0f",price];
    
    [self changeStyleWithIsDetail:_isDetail];
    
    
    
}


- (void)setIsDetail:(BOOL)isDetail{
    
    _isDetail = isDetail;
    
    [self changeStyleWithIsDetail:_isDetail];
    
    
}


/*- (void)changeStyleWithIsDetail:(BOOL)detail{
    WEAKSELF(wk);

    
    if (detail) {
        
        TotalPriceModel * total = [TotalPriceModel dataModel];

        _timePriceLB.text = [NSString stringWithFormat:@"计时费:  %.0f",total.timePrice];
        
        CGFloat h = 25 ;
        
//        [_timePriceLB mas_updateConstraints:^(MASConstraintMaker *make) {
//            
//            make.height.mas_equalTo(@(h));
//                        
//        }];
//
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(h + 44);
        }];
        
        if (total.projectPrice > 0) {
            
            _projectPriceLB.text = [NSString stringWithFormat:@"开台费:  %.0f",total.projectPrice];
            
            [_projectPriceLB mas_updateConstraints:^(MASConstraintMaker *make) {
                
                make.height.mas_equalTo(@(h));
                
            }];
            h +=25;
            
        }if (total.shopPrice > 0) {
            
            _shopPriceLB.text = [NSString stringWithFormat:@"耗材费:  %.0f",total.shopPrice];
            
            [_shopPriceLB mas_updateConstraints:^(MASConstraintMaker *make) {
                
                make.height.mas_equalTo(@(h));
                
            }];
            h +=25;

        }
       

        
    }else{
        
        
        _timePriceLB.text = @"";
        _projectPriceLB.text = @"";
        _shopPriceLB.text = @"";
        
        [_timePriceLB mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(@0);
            
        }];

        [_projectPriceLB mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(@0);
            
        }];
        
        [_shopPriceLB mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(@0);
            
        }];
        [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(wk);;
            
            make.height.mas_equalTo(@44);
        }];
        

        
    }
    
    
    
    
    
    
}*/

- (void)changeStyleWithIsDetail:(BOOL)detail{
    
    if (detail) {
        
        TotalPriceModel * total = [TotalPriceModel dataModel];
        
       _timePriceLB.text = [NSString stringWithFormat:@"计时费:  %.0f",total.timePrice];
        if (total.projectPrice > 0) {
            
            _projectPriceLB.text = [NSString stringWithFormat:@"开台费:  %.0f",total.projectPrice];
            
        }if (total.shopPrice > 0 && !(total.projectPrice > 0)) {
            
            _projectPriceLB.text = [NSString stringWithFormat:@"耗材费:  %.0f",total.shopPrice];
        }if (total.shopPrice > 0 && total.projectPrice > 0) {
            
            _projectPriceLB.text = [NSString stringWithFormat:@"开台费:  %.0f",total.projectPrice];
            _shopPriceLB.text = [NSString stringWithFormat:@"耗材费:  %.0f",total.shopPrice];

            
        }
        
        
        
        }else{
        
        _timePriceLB.text = @"";
        _projectPriceLB.text = @"";
        _shopPriceLB.text = @"";
    }
}

-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = 10; //设置行间距
    paraStyle.hyphenationFactor = 0.0;//连字间距
    paraStyle.firstLineHeadIndent = 0.0;//首行缩进
    paraStyle.paragraphSpacingBefore = 0.0;//段与段之间的间距
    paraStyle.headIndent = 0;//整体缩进首行除外
    paraStyle.tailIndent = 0;
    paraStyle.paragraphSpacingBefore = 10;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.0f};
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
}



@end
