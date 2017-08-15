//
//  MineViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/7/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MineViewController.h"
#import "MineHelper.h"
@interface MineViewController ()

@property (nonatomic, strong) MineHelper * mineHelp;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    int a[5] = {1,2,3,4,5};
    
    int * ptr = (int *)(&a+1);
    
    NSLog(@"%d,%d",*(a+1),*(ptr-1));
    
    
    [self addMineHelp];
    

}

- (void)addMineHelp{
    
    _mineHelp = [MineHelper blog];
    
    [self.view addSubview:_mineHelp.tableView];
    
    WEAKSELF(wk);
    [_mineHelp.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.equalTo(wk.view);
        make.bottom.equalTo(wk.view).offset(-49);
        
    }];
    
    
}



@end
