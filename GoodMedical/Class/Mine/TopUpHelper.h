//
//  TopUpHelper.h
//  GoodMedical
//
//  Created by zhou on 2017/8/28.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopUpHelper : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic,strong) NSArray * dataArray;
+(instancetype)blog;


@end
