//
//  LeftTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/7/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "LeftTableViewCell.h"

@interface LeftTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *selectView;

@end

@implementation LeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)selectedType:(BOOL)select{
    
    _selectView.hidden = select ? NO : YES;
    self.backgroundColor = select ? [UIColor orangeColor] : [UIColor whiteColor];
    
    
}



@end
