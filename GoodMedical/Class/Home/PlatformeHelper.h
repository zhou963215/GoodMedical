//
//  PlatformeHelper.h
//  GoodMedical
//
//  Created by zhou on 2017/8/2.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlatformeHelper : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic,strong) NSArray * dataArray;

+(instancetype)blog;



@end
