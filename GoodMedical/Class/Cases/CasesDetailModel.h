//
//  CasesDetailModel.h
//  GoodMedical
//
//  Created by zhou on 2017/8/10.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CasesDetailModel : NSObject

@property (nonatomic, copy) NSString * time;
@property (nonatomic, copy) NSString * type;
@property (nonatomic, strong) NSArray  * imageArray;
@property (nonatomic, copy) NSString * detailText;

@end
