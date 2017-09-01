//
//  LevelTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/30.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "LevelTableViewCell.h"
#import "LevelCollectionViewCell.h"
#import "MembersModel.h"
@interface LevelTableViewCell ()<UICollectionViewDataSource, UICollectionViewDelegate>


@property (nonatomic, strong) UICollectionView * collectionView;


@end

@implementation LevelTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
//        NSArray * arr = @[@{@"name":@"3800.00元(3个月)",@"isClick":@0},@{@"name":@"7800.00元(6个月)",@"isClick":@0},@{@"name":@"11800.00元(12个月)",@"isClick":@0}];
        [self creatData];
        [self setSubviews];

    }
    
    return self;
    
}


- (void)setApList:(NSArray *)apList{
    
    
    
    
}

- (void)setSubviews{
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(WIDTH/2, 40);
    flowLayout.minimumInteritemSpacing=0; //cell之间左右的
    flowLayout.minimumLineSpacing=1;      //cell上下间隔
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;

    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    
    mainView.backgroundColor = [UIColor whiteColor];
    mainView.pagingEnabled = YES;
    mainView.alwaysBounceVertical = YES;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    mainView.scrollEnabled = NO;
    [mainView registerNib:[UINib nibWithNibName:@"LevelCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"level"];
    mainView.dataSource = self;
    mainView.delegate = self;
    
    _collectionView = mainView;
    [self addSubview:_collectionView];

    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.bottom.equalTo(self);
    }];
    
    
    
    
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _apList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LevelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"level" forIndexPath:indexPath];
    MembersModel * dict = _apList[indexPath.row];
    [cell setUpDataWithDict:dict];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    for (MembersModel * model in _apList) {
        
        model.isClick = NO;
    }
    
    MembersModel * model = _apList[indexPath.row];
    model.isClick = YES;
    _select = indexPath.row+1;
    [collectionView reloadData];
    
}

- (void)creatData{
    
    
    
    NSArray * arr = @[@"3800.00元(3个月)",@"7800.00元(6个月)",@"11800.00元(12个月)"];
    NSMutableArray * array  = [NSMutableArray array];
    for (NSString * str in arr) {
        
        MembersModel * members = [MembersModel new];
        members.title = str;
        members.isClick = NO;
        [array addObject:members];
        
    }
    
    _apList = array;
    
    
}

@end
