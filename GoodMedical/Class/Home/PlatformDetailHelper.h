//
//  PlatformDetailHelper.h
//  GoodMedical
//
//  Created by zhou on 2017/8/3.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlatformDetailHelper : NSObject<UITableViewDelegate, UITableViewDataSource>

+(instancetype)blog;
@property (strong, nonatomic) UITableView *tableView;

@end
