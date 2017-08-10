//
//  DetailCaseFrame.m
//  GoodMedical
//
//  Created by zhou on 2017/8/10.
//  Copyright © 2017年 zhou. All rights reserved.
//
#define image_H ([UIScreen mainScreen].bounds.size.width - 20)/6

#import "DetailCaseFrame.h"

@implementation DetailCaseFrame

- (void)setModel:(CasesDetailModel *)model{
    
    _model = model;
    
    CGFloat h = 47;
    
    if (model.imageArray.count > 0) {
        
       h+=(model.imageArray.count/6) * image_H + image_H +40;
    }else{
        
        h+= 67;
        
    }
     CGSize detailSize = [model.detailText boundingRectWithSize:CGSizeMake(WIDTH-54, CGFLOAT_MAX) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:14] } context:nil ].size;
    
    h +=detailSize.height;
    
    
    _rowHeight = h;
    
}


@end
