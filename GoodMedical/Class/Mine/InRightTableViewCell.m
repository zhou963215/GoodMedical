//
//  InRightTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/17.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "InRightTableViewCell.h"
#import "TotalPriceModel.h"
@interface InRightTableViewCell ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel * nameLB;
@property (nonatomic, strong) UILabel * priceLB;
@property (nonatomic, strong) UITextField * priceTextField;


@end



@implementation InRightTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setSubviews];
    }
    
    return self;
}

- (void)setSubviews{
    
    _nameLB = [UILabel new];
    _nameLB.text = @"德玛西亚";
    _nameLB.textColor = UICOLORRGB(0x888888);
    _nameLB.font = [UIFont systemFontOfSize:14];
    [self addSubview:_nameLB];
    
    _priceLB = [UILabel new];
    _priceLB.textColor = [UIColor cyanColor];
    _priceLB.hidden = YES;
    _priceLB.font = [UIFont systemFontOfSize:14];
    _priceLB.text = @"¥";

    [self addSubview:_priceLB];
    
    _priceTextField = [UITextField new];
    _priceTextField.layer.borderWidth = 0.5 ;
    _priceTextField.hidden = YES;
    _priceTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _priceTextField.delegate = self;
    _priceTextField.font = [UIFont systemFontOfSize:14];
    _priceTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:_priceTextField];
    
    WEAKSELF(wk);
    
    
    
    [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk).offset(10);
        make.centerY.equalTo(wk);
    }];
    
    
    [_priceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(wk.priceTextField.mas_left).offset(-5);
        make.centerY.equalTo(wk);
    }];
    
    [_priceTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(wk).offset(-10);
        make.centerY.equalTo(wk);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];
    
}

- (void)setIsSelect:(BOOL)isSelect{
    
    _isSelect = isSelect;
    
    _priceTextField.hidden = !_isSelect;
    _priceLB.hidden = !_isSelect;
    
    if (!_isSelect) {
        
        _priceTextField.text = @"";
    }
    
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
        
        TotalPriceModel * total = [TotalPriceModel dataModel];
        
        for (ShoppingModel * selectModel in total.shopChangeArray) {
            
            if ([selectModel.name isEqualToString:_dataModel.name]) {
                
                if (textField.text.length>0) {

                selectModel.inPrice = textField.text;
                selectModel.isPrice = YES;
                }else{
                    
                    selectModel.inPrice = @"";
                    selectModel.isPrice = NO;

                }
                
            }
            
        }
        
    
}

- (void)setUpDataWithModel:(ShoppingModel *)model{
    
    self.isSelect = NO;
    
    TotalPriceModel * total = [TotalPriceModel dataModel];
    
    for (ShoppingModel * selectModel in total.shopChangeArray) {
        
        if ([selectModel.name isEqualToString:model.name]) {
            
            model.inPrice = selectModel.inPrice;
            self.isSelect = YES;
        }
        
    }
    _dataModel  = model;
    _nameLB.text= _dataModel.name;
    _priceTextField.text = _dataModel.inPrice;
    
    
    
    
}


@end
