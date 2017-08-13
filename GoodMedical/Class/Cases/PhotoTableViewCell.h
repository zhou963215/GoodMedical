//
//  PhotoTableViewCell.h
//  GoodMedical
//
//  Created by zhou on 2017/8/11.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoModel.h"
@interface PhotoTableViewCell : UITableViewCell

@property (nonatomic, strong)  NSMutableArray *selectedPhotos;//选中的图片

@property (nonatomic, copy) void (^rowHeight)(CGFloat);

@end
