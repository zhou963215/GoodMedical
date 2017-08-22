//
//  InRightHelper.h
//  GoodMedical
//
//  Created by zhou on 2017/8/17.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InRightHelper : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray * selectArray;
@property (nonatomic,strong) NSArray * dataArray;

+(instancetype)blog;


@end
