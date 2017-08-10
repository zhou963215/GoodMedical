//
//  MineHelper.h
//  GoodMedical
//
//  Created by zhou on 2017/8/10.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineHelper : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic,strong) NSArray * dataArray;

+(instancetype)blog;


@end
