//
//  BaseCMViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/7/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "BaseCMViewController.h"

@interface BaseCMViewController ()
@end

@implementation BaseCMViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent=NO;
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBarTintColor: RGB(27, 130, 210)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    if (self.navigationController.viewControllers.count>1) {
        
        [self backButton];
 
    }
    
    



}
- (void)backButton{
    
    
    UIButton  *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backLastView) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.frame = CGRectMake(0, 0, 60, 40);
    leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 46);
    //    leftBtn.backgroundColor = [UIColor redColor];
    //将leftItem设置为自定义按钮
    UIBarButtonItem  *leftItem =[[UIBarButtonItem alloc]initWithCustomView: leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

- (void)backLastView{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)hiddenLeft{
    
    self.navigationItem.leftBarButtonItem = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];



}


@end
