//
//  DoctorPhotoTableViewCell.h
//  GoodMedical
//
//  Created by zhou on 2017/8/17.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorPhotoTableViewCell : UITableViewCell
@property (nonatomic, strong)  NSMutableArray *selectedPhotos;//选中的图片
- (instancetype)initWithTitle:(NSString *)title;
@end
