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
    

    NSArray * arr =  @[ @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                        @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                        @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"];
    

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
