//
//  OperationTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/7/29.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "OperationTableViewCell.h"

@implementation OperationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



-(void)selectedType:(BOOL)select{
    
    self.backgroundColor = select ? [UIColor blueColor] : [UIColor whiteColor];
    
    
}


@end
