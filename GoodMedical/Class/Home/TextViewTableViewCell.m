//
//  TextViewTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/3.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "TextViewTableViewCell.h"

@interface TextViewTableViewCell ()<UITextViewDelegate>{
    
    UILabel *placeHold;

}

@property (nonatomic, strong) UITextView * textViewInput;

@end


@implementation TextViewTableViewCell


- (instancetype)initWithPlaceHold:(NSString *)place{
    self = [self init];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        _textString = @"";
        [self setSubviews];
        placeHold.text = place;

    }
    
    
    return self;
}

- (instancetype)init{
    
    self = [super init];
    
    
    
    return self;
}


-(void)setSubviews{
    
    
    //输入框
    self.textViewInput = [UITextView new];
    self.textViewInput.delegate = self;
    self.textViewInput.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.textViewInput];
    
    //输入框的提示语
    placeHold = [[UILabel alloc]init];
    placeHold.textColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.8];
    placeHold.font = [UIFont systemFontOfSize:15];
    [self.textViewInput addSubview:placeHold];
    
    WEAKSELF(wk);
    
    [_textViewInput mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(wk).offset(20);
        make.right.bottom.equalTo(wk).offset(-20);
        make.height.mas_equalTo(@100);
        
    }];
    
    [placeHold mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk.textViewInput);
        make.top.equalTo(wk.textViewInput).offset(5);
        
    }];
    
}

#pragma mark - TextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    placeHold.hidden = self.textViewInput.text.length > 0;
    
    
    
    
}

- (void)textViewDidChange:(UITextView *)textView
{
    placeHold.hidden = textView.text.length>0;
}



- (void)textViewDidEndEditing:(UITextView *)textView
{
    placeHold.hidden = self.textViewInput.text.length > 0;
    _textString = textView.text;
    
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    return YES;
}



@end
