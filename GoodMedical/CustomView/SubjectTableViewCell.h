//
//  SubjectTableViewCell.h
//  RaisePo
//
//  Created by zhou on 2016/12/1.
//  Copyright © 2016年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>
@interface SubjectTableViewCell : UITableViewCell

@property(nonatomic,copy)NSString * value;
@property(nonatomic,strong)UILabel * nameLB;
@property(nonatomic,strong)UITextView * inupt;
@property(copy,nonatomic)void (^upHeight)(CGFloat);
- (void)setTitle:(NSString *)title withValue:(id)value;
- (instancetype)initWithTitle:(NSString*)title subject:(NSString *)subject height:(CGFloat)height;
@end

