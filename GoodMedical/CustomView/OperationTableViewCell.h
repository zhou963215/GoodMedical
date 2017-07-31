//
//  OperationTableViewCell.h
//  GoodMedical
//
//  Created by zhou on 2017/7/29.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OperationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

-(void)selectedType:(BOOL)select;

@end
