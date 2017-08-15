//
//  PublicTools.m
//  GoodMedical
//
//  Created by zhou on 2017/8/14.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "PublicTools.h"

@implementation PublicTools
+ (NSString * )defaultDate{
    
    
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringFromDate:date];
    
}



@end
