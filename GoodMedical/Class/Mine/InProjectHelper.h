//
//  InProjectHelper.h
//  GoodMedical
//
//  Created by zhou on 2017/8/18.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InProjectHelper : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic,strong) NSArray * dataArray;
@property (nonatomic, copy) void(^nextStep)(NSInteger);

+(instancetype)blog;


@end
