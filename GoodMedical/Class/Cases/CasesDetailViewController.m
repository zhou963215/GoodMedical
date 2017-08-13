//
//  CasesDetailViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/8/8.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "CasesDetailViewController.h"
#import "CasesDetailHelper.h"
#import "DetailCaseFrame.h"
#import "CasesAfterViewController.h"
@interface CasesDetailViewController ()

@property (nonatomic ,strong) CasesDetailHelper * detailHelp;

@end

@implementation CasesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"病程";
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"添加" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.frame = CGRectMake(0, 0, 40, 50);
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:self action:@selector(addNewCases) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    [self addCasesHlep];
    

}

- (void)addNewCases{
    
    [self.navigationController pushViewController:[CasesAfterViewController new] animated:YES];
    
    
}


- (void)addCasesHlep{
    
    _detailHelp = [CasesDetailHelper blog];
    [self.view addSubview:_detailHelp.tableView];
    
    WEAKSELF(wk);
    [_detailHelp.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.bottom.equalTo(wk.view);
        
    }];
    
    
    NSMutableArray * arr = [NSMutableArray array];
    
    NSArray * dataArr = @[@{@"time":@"2017-08-08",@"type":@"入院",@"detailText":@"我的志愿是做一个工程师,每天会做很多工程,下班后,我倒超级超市,买一大瓶可乐,一包卤水蛋,还有一包火腿,因为,减价啊!\n我的志愿是做一个消防队长,每天,我会扑灭很多火,下班后,我和我的队员小强,小明,芙蓉姐他们一起吃个套餐,有虾有鱼,还有可以选择冬瓜蛊代替例汤,可是要加三十元",@"imageArray" :@[@"http://picture.youth.cn/dmzb/201305/W020130514542662922703.jpg",
                                                                                                                                                                                                                                              @"http://img5q.duitang.com/uploads/item/201504/15/20150415H5703_nusHC.jpeg",
                                                                                                                                                                                                                                              @"http://img4q.duitang.com/uploads/item/201505/01/20150501192519_xLEac.thumb.700_0.jpeg",
                                                                                                                                                                                                                                              @"http://img5.duitang.com/uploads/item/201503/05/20150305192547_Tewcf.jpeg",
                                                                                                                                                                                                                                              @"http://img5q.duitang.com/uploads/item/201407/31/20140731202921_Qudzv.thumb.700_0.png",
                                                                                                                                                                                                                                              @"http://2t.5068.com/uploads/allimg/150328/1033006409-5.png",
                                                                                                                                                                                                                                              @"http://im5.tongbu.com/wallpaper/20120606/013becf7-0.jpg.488_488.jpg",
                                                                                                                                                                                                                                              @"http://cdn.duitang.com/uploads/item/201211/24/20121124074205_5LPfy.jpeg",
                                                                                                                                                                                                                                              @"http://b.hiphotos.baidu.com/zhidao/pic/item/91529822720e0cf32e663d440b46f21fbf09aaf8.jpg"]},@{@"time":@"2017-08-08",@"type":@"入院",@"detailText":@"我的志愿是做一个工程师,每天会做很多工程,下班后,我倒超级超市,买一大瓶可乐,一包卤水蛋,还有一包火腿,因为,减价啊!\n我的志愿是做一个消防队长,每天,我会扑灭很多火,下班后,我和我的队员小强,小明,芙蓉姐他们一起吃个套餐,有虾有鱼,还有可以选择冬瓜蛊代替例汤,可是要加三十元",@"imageArray":@[]}];
    
    
    for (int i = 0; i < 10; i++ ) {
        
        
        int j = i%2;
        
        NSLog(@"%d",j);
        
        DetailCaseFrame * frame = [DetailCaseFrame new];
        
        CasesDetailModel * model = [CasesDetailModel modelWithDictionary:dataArr[j]];
        
        frame.model = model;
        
        [arr addObject:frame];
        
        
    }
    
    
    
    _detailHelp.dataArray = arr;

}
@end
