//
//  XPNewsViewController.m
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "XPNewsViewController.h"
#import "NewsCollectionContainer.h"


#import "NewsModel.h"
#import "NewsListFrame.h"

#import "TopScrollTab.h"

#define kTitles @[@"头条", @"社会", @"国内", @"国际", @"娱乐", @"体育", @"军事", @"科技", @"财经", @"时尚"]

@interface XPNewsViewController ()<TopScrollTabDelegate, NewsCollectionContainerDelegate>

@property (nonatomic, strong) TopScrollTab *topTab;

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) NewsCollectionContainer *container;

@end

@implementation XPNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_configureUI];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self topScrollTabDidSelectedTitle:@"top" atIndex:0];
}

- (void)p_configureUI
{
    [self topTab];
    [self addNewsContainer];
}

- (void)addNewsContainer
{
    _container = [[NewsCollectionContainer alloc] initWithTitleArray:kTitles];
    _container.changeDelegate = self;
    [self addChildViewController:_container];
    _container.collectionView.frame = CGRectMake(0, kNavBarHeight + 44, kScreenWidth, kScreenHeight - 108 -49);
    [self.view addSubview:_container.collectionView];
    _container.cellCount = kTitles.count;
    [_container didMoveToParentViewController:self];
}

- (void)collectionView:(UICollectionView *)collectionView moveToItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_topTab selectTitleAtIndex:indexPath.item];
}

-(void)topScrollTabDidSelectedTitle:(NSString *)title atIndex:(NSInteger)index
{
    [_container refreshNewsWithTitle:[self covertHanziToPingyin:title] selectedItem:index];
}

- (NSString *)covertHanziToPingyin:(NSString *)hanzi
{
    if (kIsEqualToString(hanzi, @"社会")) {
        return @"shehui";
    }
    if (kIsEqualToString(hanzi, @"国内")) {
        return @"guonei";
    }
    if (kIsEqualToString(hanzi, @"国际")) {
        return @"guoji";
    }
    if (kIsEqualToString(hanzi, @"娱乐")) {
        return @"yule";
    }
    if (kIsEqualToString(hanzi, @"体育")) {
        return @"tiyu";
    }
    if (kIsEqualToString(hanzi, @"军事")) {
        return @"junshi";
    }
    if (kIsEqualToString(hanzi, @"科技")) {
        return @"keji";
    }
    if (kIsEqualToString(hanzi, @"财经")) {
        return @"caijing";
    }
    if (kIsEqualToString(hanzi, @"时尚")) {
        return @"shishang";
    }
    
    return @"top";
}

- (TopScrollTab *)topTab
{
    if (!_topTab) {
        _topTab = [[TopScrollTab alloc] initWithTitles:kTitles];
        _topTab.tapDelegate = self;
        _topTab.frame = CGRectMake(0, kNavBarHeight, kScreenWidth, 44);
        [_topTab selectTitleAtIndex:0];
        [self.view addSubview:_topTab];
    }
    return _topTab;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
