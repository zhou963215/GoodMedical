//
//  MessageViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/7/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@property (nonatomic, strong) UISegmentedControl * segmentedControl;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.titleView = self.segmentedControl;

}



- (UISegmentedControl *)segmentedControl{
    
    if (!_segmentedControl) {
        
        _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"消息",@"动态"]];
        _segmentedControl.tintColor = [UIColor blueColor];
        
    }
    
    
    
    
    return _segmentedControl;
}



@end
