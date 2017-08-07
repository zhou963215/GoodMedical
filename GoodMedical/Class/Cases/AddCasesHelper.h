//
//  AddCasesHelper.h
//  GoodMedical
//
//  Created by zhou on 2017/8/5.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddCasesHelper : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic,strong) NSArray * dataArray;

@property (nonatomic, strong) NSDictionary * casesDict;

+(instancetype)blog;


@end
