//
//  XPBaseNavViewController.m
//  Life
//
//  Created by 徐攀 on 16/9/8.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "XPBaseNavViewController.h"

@interface XPBaseNavViewController ()

@end

@implementation XPBaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}



@end
