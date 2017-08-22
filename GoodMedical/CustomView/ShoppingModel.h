//
//  ShoppingModel.h
//  GoodMedical
//
//  Created by zhou on 2017/8/1.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingModel : NSObject

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * pictureUrl;
@property (nonatomic, copy) NSString * lastNumber;
@property (nonatomic, assign) CGFloat  price;
@property (nonatomic, assign) int buyNumber;



@property (nonatomic, assign) NSString * inPrice;
@property (nonatomic, assign) BOOL isPrice;
@property (nonatomic, assign) BOOL isRemove;
@end
