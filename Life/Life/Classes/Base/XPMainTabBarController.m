//
//  XPMainTabBarController.m
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "XPMainTabBarController.h"
#import "XPBaseNavViewController.h"
#import "XPMineViewController.h"
#import "XPJokeViewController.h"
#import "XPNewsViewController.h"

@implementation XPMainTabBarController


- (instancetype)init
{
    if (!(self = [super init])) return nil;
    [self configureChildVC];
    return self;
}

- (void)configureChildVC
{
    XPNewsViewController *newsVC = [[XPNewsViewController alloc] init];
    newsVC.title = @"新闻";
    
    XPJokeViewController *jokeVC = [[XPJokeViewController alloc] init];
    jokeVC.title = @"笑话";
    
    XPMineViewController *mineVC = [[XPMineViewController alloc] init];
    mineVC.title = @"我";
    
    [self configureTab:newsVC];
    [self configureTab:jokeVC];
    [self configureTab:mineVC];
}

- (void)configureTab:(UIViewController *)vc
{
    XPBaseNavViewController *nav = [[XPBaseNavViewController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
@end
