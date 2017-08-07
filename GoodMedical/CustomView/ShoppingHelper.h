//
//  ShoppingHelper.h
//  GoodMedical
//
//  Created by zhou on 2017/8/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingHelper : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray * selectArray;
@property (nonatomic,strong) NSArray * dataArray;

+(instancetype)blog;


@end
