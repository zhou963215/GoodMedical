//
//  PhotoModel.h
//  GoodMedical
//
//  Created by zhou on 2017/8/11.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoModel : NSObject

@property (nonatomic, copy) NSString * url;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, assign) BOOL isHistory;


@end
