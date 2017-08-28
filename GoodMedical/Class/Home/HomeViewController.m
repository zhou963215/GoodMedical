//
//  HomeViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/7/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h"
#import "HomeHelper.h"
@interface HomeViewController ()<SDCycleScrollViewDelegate>

@property(nonatomic,strong)SDCycleScrollView *sdcScroll;
@property(nonatomic,strong)NSMutableArray *sdcSoure;
@property(nonatomic,strong)HomeHelper * home;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSArray * arr = @[@"http://picture.youth.cn/dmzb/201305/W020130514542662922703.jpg",
                      @"http://img5q.duitang.com/uploads/item/201504/15/20150415H5703_nusHC.jpeg",
                      @"http://img5q.duitang.com/uploads/item/201407/31/20140731202921_Qudzv.thumb.700_0.png",
                      @"http://2t.5068.com/uploads/allimg/150328/1033006409-5.png",
                      @"http://im5.tongbu.com/wallpaper/20120606/013becf7-0.jpg.488_488.jpg"];
    
    

    _sdcSoure = [NSMutableArray arrayWithArray:arr];
    [self creatUI];
    
    
    
    
}

- (void)creatUI{
    
    _sdcScroll = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WIDTH, 180) shouldInfiniteLoop:YES imageNamesGroup:_sdcSoure];
    _sdcScroll.autoScrollTimeInterval = 2.5;
    _sdcScroll.delegate = self;
    _sdcScroll.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    [self.view addSubview:self.sdcScroll];
//
    _home = [HomeHelper blog];
    [self.view addSubview:_home.collection];
    WEAKSELF(wk);
    [_home.collection mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(wk.view);
        make.top.equalTo(wk.sdcScroll.mas_bottom);
        make.height.mas_equalTo(@71);
        
        
    }];
    
}



#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", index);

}

@end
