//
//  ClassificationHelper.h
//  GoodMedical
//
//  Created by zhou on 2017/7/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassificationHelper : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property(nonatomic,strong)NSArray * dataArray;
@property (nonatomic, copy) void(^selected)(NSDictionary *);
@property (nonatomic ,strong) NSDictionary * lastSelectDict;
+(instancetype)blog;


@end
