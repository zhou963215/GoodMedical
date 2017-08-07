//
//  HomeHelper.h
//  GoodMedical
//
//  Created by zhou on 2017/8/2.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeHelper : NSObject<UICollectionViewDataSource, UICollectionViewDelegate>
@property(nonatomic,strong)NSArray * apList;

+(instancetype)blog;
- (UICollectionView *)collection;


@end
