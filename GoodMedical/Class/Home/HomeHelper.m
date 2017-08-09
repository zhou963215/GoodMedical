//
//  HomeHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/2.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "HomeHelper.h"
#import "HomeCollectionViewCell.h"
#import "PlatformeViewController.h"
#import "CasesViewController.h"
@interface HomeHelper ()
@property(nonatomic,strong) UICollectionView * collection;

@property (nonatomic, weak) UICollectionViewFlowLayout *flowLayout;
@end

@implementation HomeHelper

+(instancetype)blog{
    
    return [[HomeHelper alloc]init];
}

- (instancetype)init{
    
    
    if (self = [super init]) {
        
        NSArray * arr = @[@{@"image":@"o_3",@"name":@"病例库"},@{@"image":@"o_3",@"name":@"平台预约"},@{@"image":@"o_3",@"name":@"我的患者"}];
        _apList = arr;
        
        
        [self setuCollection];
    }
    
    
    return self;
    
}


- (void)setApList:(NSArray *)apList{
    
    _apList = apList;
    
    [self.collection reloadData];
    //    [self setuCollection];
    
    
    
}

- (void)setuCollection
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((WIDTH-2)/3, 70);
    flowLayout.minimumInteritemSpacing=1; //cell之间左右的
    flowLayout.minimumLineSpacing=1;      //cell上下间隔
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _flowLayout = flowLayout;
    
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    
    mainView.backgroundColor = GAYCOLOR;
    mainView.pagingEnabled = YES;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    [mainView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:@"home"];
    mainView.dataSource = self;
    mainView.delegate = self;
    _collection = mainView;
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _apList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"home" forIndexPath:indexPath];
    NSDictionary * dict = _apList[indexPath.row];
    [cell setUpDataWithDict:dict];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:{
            //
            [self.collection.navigationController pushViewController:[CasesViewController new] animated:YES];
        }
            break;
        case 1:{
            //回忆
            [self.collection.navigationController pushViewController:[PlatformeViewController new] animated:YES];

        }
            break;
        case 2:{
            //课堂
            //[self.cyl_tabBarController cyl_popSelectTabBarChildViewControllerAtIndex:0];
        }
            break;
               default:
            break;
    }
    
    
    
    
}


@end
