//
//  ProjectScrollView.m
//  GoodMedical
//
//  Created by zhou on 2017/7/31.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ProjectScrollView.h"

@interface ProjectScrollView ()

@property (strong, nonatomic) UIScrollView * scrollView;

@end

@implementation ProjectScrollView
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
//        [self creatScrollView];
        
    }
    
    return self;
}
- (void)layoutSubviews{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    _scrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_scrollView];
    [self setreMenUI];
    
}



- (void)setreMenUI{
    
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    
    float butX = 15;
    float butY = 10;
    for(int i = 0; i < _dataArray.count; i++){
        
        //宽度自适应
        NSDictionary *fontDict = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        CGRect frame_W = [_dataArray[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil];
        
        if (butX+frame_W.size.width+20 > self.scrollView.frame.size.width-15) {
            
            butX = 15;
            
            butY += 55;
        }
        
        UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(butX, butY, frame_W.size.width+20, 40)];
        [but setTitle:_dataArray[i] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        but.titleLabel.font = [UIFont systemFontOfSize:13];
        but.layer.cornerRadius = 8;
        but.layer.borderColor = [UIColor lightGrayColor].CGColor;
        but.layer.borderWidth = 1;
        but.tag = i+1;
        [but setBackgroundColor:[UIColor cyanColor]];
        [but addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:but];
        
        butX = CGRectGetMaxX(but.frame)+10;
        
        if (self.lastSelectDict) {
            
            if ([but.titleLabel.text isEqualToString:self.lastSelectDict[@"name"]]) {
                
                [but setBackgroundColor:[UIColor orangeColor]];

                
            }
            
        }
        
        
        
        
    }
    
    CGRect rect = self.frame;
    rect.size.height = butY + 50;
    self.scrollView.contentSize = CGSizeMake(0, butY+50);
}
- (void)click:(UIButton * )sender{
    
    NSLog(@"%ld",(long)sender.tag);
    
    for (UIButton * button in _scrollView.subviews) {
        
        if (button.tag == sender.tag) {
            
            [button setBackgroundColor:[UIColor orangeColor]];
        }else{
            
            [button setBackgroundColor:[UIColor cyanColor]];

        }
        
        
    }
    
    self.lastSelectDict = @{@"name":sender.titleLabel.text};

    
}

- (void)setLastSelectDict:(NSDictionary *)lastSelectDict{
    
    _lastSelectDict = lastSelectDict;
    
    [self setreMenUI];
    
    
    
    
}

@end
