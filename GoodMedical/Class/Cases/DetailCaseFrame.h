//
//  DetailCaseFrame.h
//  GoodMedical
//
//  Created by zhou on 2017/8/10.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CasesDetailModel.h"
@interface DetailCaseFrame : NSObject

@property (nonatomic, assign) CGFloat rowHeight;
@property (nonatomic, strong) CasesDetailModel * model;


@end
