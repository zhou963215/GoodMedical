//
//  DetailCaseTableViewCell.h
//  GoodMedical
//
//  Created by zhou on 2017/8/8.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CasesImageView : UIView

@end

@interface CasesCoentView : UIView

@end

@interface DetailCaseTableViewCell : UITableViewCell
- (void)upDataWithModel:(NSDictionary *)dict;
@end
