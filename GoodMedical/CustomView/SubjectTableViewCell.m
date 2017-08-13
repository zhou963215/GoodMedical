//
//  SubjectTableViewCell.m
//  RaisePo
//
//  Created by zhou on 2016/12/1.
//  Copyright © 2016年 zhou. All rights reserved.
//




#import "SubjectTableViewCell.h"

@interface SubjectTableViewCell()<UITextViewDelegate>

@end


@implementation SubjectTableViewCell


- (instancetype)init{
    
    self = [super init];
    return self;
}
- (instancetype)initWithTitle:(NSString*)title subject:(NSString *)subject height:(CGFloat)height{
    
    self =  [super init];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setSubviews];
        _inupt.text = subject;
        _value = @"";
        self.backgroundColor = [UIColor whiteColor];
    }
   
    
    
    return self;
}

- (void)setSubviews{
    
    WEAKSELF(wk);
    
    self.inupt = [UITextView new];
    _inupt.delegate = self;
    _inupt.font = [UIFont systemFontOfSize:14];
    _inupt.textColor = UICOLORRGB(0x8f8f8f);
    [self addSubview:self.inupt];
    
    
    [_inupt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wk).offset(20);
        make.right.equalTo(wk).offset(-20);
        make.top.equalTo(wk).offset(10);
        make.bottom.equalTo(wk.mas_bottom).offset(-10);
    }];
    
   
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    
    if (textView.text.length>0) {
         self.value = textView.text;
    }
    else{
        textView.text = @"请输入记录描述";
        self.value = @"";
    }
    
   
    
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    if ([textView.text isEqualToString:@"请输入记录描述"]) {
     
        textView.text = @"";
      
    }
    
    
}

- (void)textViewDidChange:(UITextView *)textView
{
    
    CGRect bounds = textView.bounds;
    // 计算 text view 的高度
    CGSize maxSize = CGSizeMake(WIDTH-30, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    bounds.size = newSize;
    if (self.upHeight) {
        self.upHeight(bounds.size.height);
    }
    
}

- (void)setTitle:(NSString *)title withValue:(id)value{

    self.value = value;
    self.inupt.text = title;
    
}


@end
