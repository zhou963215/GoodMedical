//
//  LevelCollectionViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/30.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "LevelCollectionViewCell.h"

@interface LevelCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *priceLB;


@end

@implementation LevelCollectionViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];

    

}

- (void)setUpDataWithDict:(MembersModel *)model{
    
    
    _priceLB.text = model.title;
    _priceLB.textColor = model.isClick ? [UIColor redColor] : UICOLORRGB(0x777777);
}

@end
