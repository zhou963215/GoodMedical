//
//  LocationAdress.h
//  GoodMedical
//
//  Created by zhou on 2017/8/16.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LocationAdress : NSObject<CLLocationManagerDelegate>
@property (nonatomic, copy) void(^adress)(NSString * administrativeArea,NSString * currentCity,NSString * subLocality);

- (void)locatemap;
+(instancetype)blogWithVc:(UIViewController *)vc;
- (instancetype)initWithViewControll:(UIViewController *)vc;
- (void)refreshAdress:(void(^)(NSString *administrativeArea ,NSString *currentCity,NSString *subThoroughfare))adress;


@end
