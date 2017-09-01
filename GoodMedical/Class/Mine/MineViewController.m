//
//  MineViewController.m
//  GoodMedical
//
//  Created by zhou on 2017/7/26.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MineViewController.h"
#import "MineHelper.h"
#import <objc/runtime.h>
@interface MineViewController ()

@property (nonatomic, strong) MineHelper * mineHelp;

@end

@implementation MineViewController
void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    // the method doesn’t exist and we just added one
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}



+(void)load{
    
    swizzleMethod([self class],@selector(method1),@selector(method2));
    swizzleMethod([self class],@selector(method2),@selector(method3));

    
}
- (void)method1{
    
    NSLog(@"1");
    
}
- (void)method2{
    
    NSLog(@"2");
    [self method2];
    
}
- (void)method3{
    
    NSLog(@"3");
    [self method3];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self method1];
    
    NSLog(@"------------------");
    [self method2];
    NSLog(@"------------------");
    [self method3];
    
    
    
//    int a[5] = {1,2,3,4,5};
//    
//    int * ptr = (int *)(&a+1);
//    
//    NSLog(@"%d,%d",*(a+1),*(ptr-1));
    
    
    [self addMineHelp];
    

}

- (void)addMineHelp{
    
    _mineHelp = [MineHelper blog];
    
    [self.view addSubview:_mineHelp.tableView];
    
    WEAKSELF(wk);
    [_mineHelp.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.equalTo(wk.view);
        make.bottom.equalTo(wk.view).offset(-49);
        
    }];
    
    
}



@end
