//
//  PeriodTimeView.m
//  GoodMedical
//
//  Created by zhou on 2017/7/31.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "PeriodTimeView.h"
#import "PeriodCollectionViewCell.h"
@interface PeriodTimeView ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    
    NSInteger startCode;
    NSInteger endCode;
    NSInteger selectCode;
    BOOL sucessType;
    
    
}

@property(nonatomic,strong)UICollectionView * collection;

@property (nonatomic, weak) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic ,strong) NSMutableArray * selectArray;

@end


@implementation PeriodTimeView


- (instancetype )initWithFrame:(CGRect)frame{
    
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        _selectArray = [NSMutableArray array];
        selectCode = 1000;
        startCode = 1001;
        endCode = 1002;
        [self creatHeadView];
        [self setuCollection];
        
    }
    
    return self;
}

- (void)setuCollection
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((WIDTH-3)/4, 50);
    flowLayout.minimumInteritemSpacing=1; //cell之间左右的
    flowLayout.minimumLineSpacing=1;      //cell上下间隔
    //    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _flowLayout = flowLayout;
    
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 44, WIDTH, self.frame.size.height-45) collectionViewLayout:flowLayout];
    
    mainView.backgroundColor = [UIColor lightGrayColor];
    mainView.scrollEnabled = NO;
    mainView.pagingEnabled = YES;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    [mainView registerClass:[PeriodCollectionViewCell class] forCellWithReuseIdentifier:@"period"];
    mainView.dataSource = self;
    mainView.delegate = self;
    _collection = mainView;
    [self addSubview:mainView];
}
#pragma mark - UICollectionViewDataSource




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 24;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PeriodCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"period" forIndexPath:indexPath];
    [cell setUpDataWithNSDictionary:@{@"time":@"10:00",@"price" : @"200/h"}];
    
    cell.contentView.backgroundColor = [UIColor whiteColor];

    if ( indexPath.row == selectCode) {
        
        [_selectArray addObject:@(indexPath.row)];
    
        cell.contentView.backgroundColor = [UIColor blueColor];
        
    }
    if (endCode != 1002) {
        
       
        if ((indexPath.row > startCode && indexPath.row < endCode)  ||  indexPath.row == startCode || indexPath.row == endCode) {
            
            [_selectArray addObject:@(indexPath.row)];
            cell.contentView.backgroundColor = [UIColor blueColor];
            
        }
        
    }
    
   
    
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [_selectArray removeAllObjects];
    
    if (sucessType) {
        
        if (indexPath.row == startCode || indexPath.row == endCode) {
            
            return;
            
        }else if (indexPath.row < endCode && indexPath.row > startCode ) {
            
            sucessType = NO;
            startCode = 1001;
            endCode = 1002;
            selectCode = indexPath.row;
            
        }else if (indexPath.row < startCode){
            
            startCode = indexPath.row;
            
        }else if(indexPath.row > endCode){
            
            endCode = indexPath.row;
            
        }
        
        
        
    }else{
        
        if (selectCode != 1000 ) {
            
            
                if (indexPath.row > selectCode ) {
                    
                    startCode = selectCode;
                    endCode = indexPath.row;
                    selectCode = 1000;
                }else if (indexPath.row == selectCode){
                    
                    return;
                    
                }else{
                    
                    endCode = selectCode;
                    startCode = indexPath.row;
                    selectCode = 1000;
                    
                }
                
                
                sucessType = YES;
                
        }else{
            
            selectCode = indexPath.row;
            
        }
        
        
        
    }
    
    [collectionView reloadData];
    
    
}


- (void)creatHeadView{
    
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 43)];
    headView.backgroundColor = [UIColor whiteColor];
    [self addSubview:headView];
    
    UILabel * titleLabel = [UILabel new];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.text = @"请选择起止时间:";
    [headView addSubview:titleLabel];
    
//    WEAKSELF(wk);
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(headView);
        
    }];
    
    
    
    
}



@end
