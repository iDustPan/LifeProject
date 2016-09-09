//
//  XPBaseViewController.m
//  Life
//
//  Created by 徐攀 on 16/9/7.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "XPBaseViewController.h"

@implementation XPBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureCustomBackBtn];
}

- (void)configureCustomBackBtn
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backBtn addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:kImageWithName(@"backwrite") forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0, 24, 24);
    
    if (!(self.navigationController.childViewControllers[0] == self)) {
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    }
}

- (void)backButtonAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

@end
