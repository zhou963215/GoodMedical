//
//  LevelCollectionViewCell.h
//  GoodMedical
//
//  Created by zhou on 2017/8/30.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MembersModel.h"
@interface LevelCollectionViewCell : UICollectionViewCell
@property (nonatomic,assign) BOOL isClick;
- (void)setUpDataWithDict:(MembersModel *)model;
@end
