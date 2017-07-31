//
//  LeftTableViewCell.h
//  GoodMedical
//
//  Created by zhou on 2017/7/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
-(void)selectedType:(BOOL)select;
@end
