//
//  ProjectScrollView.h
//  GoodMedical
//
//  Created by zhou on 2017/7/31.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectScrollView : UIView
@property (strong, nonatomic) NSMutableArray * dataArray;
@property (strong, nonatomic) NSDictionary * lastSelectDict;

- (void)setreMenUI;

@end
