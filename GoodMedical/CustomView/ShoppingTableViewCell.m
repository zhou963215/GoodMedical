//
//  ShoppingTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ShoppingTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "TotalPriceModel.h"
@interface ShoppingTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UILabel *buyNumberLB;
@property (weak, nonatomic) IBOutlet UIButton *reductionButton;

@property (nonatomic, strong) ShoppingModel * dataModel;
@property (nonatomic, strong) TotalPriceModel * total;

@end

@implementation ShoppingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    _total = [TotalPriceModel dataModel];
    self.addButton.layer.cornerRadius = 9;
    self.reductionButton.layer.cornerRadius = 9;

}

- (void)setUpDataWithModel:(ShoppingModel *)model{
    
    
    for (ShoppingModel * selectModel in _total.shopArray) {
        
        if ([selectModel.name isEqualToString:model.name]) {
            
            model.buyNumber = selectModel.buyNumber;
            
        }
        
    }
    
    
    _dataModel = model;
    
    _nameLabel.text = model.name;
    [_headImage sd_setImageWithURL:[NSURL URLWithString:model.pictureUrl]];
    _numberLabel.text = model.lastNumber;
    _priceLabel.text = [NSString stringWithFormat:@"¥%.2f",model.price];
    _buyNumberLB.text = [NSString stringWithFormat:@"%d",model.buyNumber];
    
    
    
    
}


//添加
- (IBAction)addClick:(id)sender {
    
    int number = [self.buyNumberLB.text intValue];
    _dataModel.buyNumber++;
    
    if (number == 0) {
    
       [ _total.shopChangeArray addObject:_dataModel];
        
    }
    
    number ++;
    self.buyNumberLB.text = [NSString stringWithFormat:@"%d",number];
    
    
    
    
    
}
//减少
- (IBAction)reductionClick:(id)sender {
    
    int number = [self.buyNumberLB.text intValue];

    
    if (number ==0) {
        
        
        return;
    }
    
    _dataModel.buyNumber--;
    
    if (_dataModel.buyNumber == 0) {
        
        
        NSMutableArray * array = [_total.shopChangeArray mutableCopy];
        
        for (ShoppingModel * model in array) {
            
            if ([model.name isEqualToString:_dataModel.name]) {
                
                [_total.shopChangeArray removeObject:model];
                
            }
        }
        
        
        
    }else{
        
        
        for (ShoppingModel * model in _total.shopChangeArray) {
            
            if ([model.name isEqualToString:_dataModel.name]) {
                
                model.buyNumber = _dataModel.buyNumber;
                
                
            }
            
            
        }
        
        
    }
    
    
    number --;
    
    
    
    self.buyNumberLB.text = [NSString stringWithFormat:@"%d",number];
    
    

}






@end
