//
//  PriceDetailCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/4.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "PriceDetailCell.h"
#import "TotalPriceModel.h"
@interface PriceDetailCell ()

@property (weak, nonatomic) IBOutlet UILabel *priceLB;

@property (weak, nonatomic) IBOutlet UILabel *timePriceLB;

@property (weak, nonatomic) IBOutlet UILabel *projectPriceLB;
@property (weak, nonatomic) IBOutlet UILabel *shopPriceLB;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shopHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *projcetHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *timeHeight;

@end

@implementation PriceDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self hidePrice];

}

- (void)hidePrice{
    
    
    self.shopHeight.constant = 0;
    self.projcetHeight.constant = 0;
    self.timeHeight.constant = 0;
    
    
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


- (void)changeStyleWithIsDetail:(BOOL)detail{
    
    
    if (detail) {
        
        TotalPriceModel * total = [TotalPriceModel dataModel];
        
        _timePriceLB.text = [NSString stringWithFormat:@"计时费:  %.0f",total.timePrice];
        
        _timeHeight.constant = 25;
        
        if (total.projectPrice > 0) {
            
            _projectPriceLB.text = [NSString stringWithFormat:@"开台费:  %.0f",total.projectPrice];
            
            _projcetHeight.constant = 25;
        }if (total.shopPrice > 0) {
            
            _shopPriceLB.text = [NSString stringWithFormat:@"耗材费:  %.0f",total.shopPrice];
            
            _shopHeight.constant = 25;
            
        }
        
        
    }else{
        
        
        _timePriceLB.text = @"";
        _projectPriceLB.text = @"";
        _shopPriceLB.text = @"";
        
        [self hidePrice];
        
    }
    
    
    
    
    
    
}


@end
