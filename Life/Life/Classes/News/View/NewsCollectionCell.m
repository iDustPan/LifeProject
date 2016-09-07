//
//  NewsCollectionCell.m
//  Life
//
//  Created by 徐攀 on 16/9/6.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "NewsListViewController.h"
#import "NewsCollectionCell.h"
#import "NewsListFrame.h"
#import "NewsModel.h"
#import "NewsListCell.h"

@interface NewsCollectionCell ()

@property (nonatomic, strong) NewsListViewController *newsListVC;
@property (nonatomic, strong) UITableView *newsList;

@end

@implementation NewsCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _newsListVC = [[NewsListViewController alloc] init];
        _newsList = _newsListVC.tableView;
        _newsList.frame = self.bounds;
        [self.contentView addSubview:_newsList];
    }
    return self;
}


- (void)setTitle:(NSString *)title
{
    _title = title.copy;
    if (title.length == 0 || title == nil) return;
    
    [_newsListVC refreshNewsListWithTitle:title];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.newsList.frame = self.bounds;
}


@end
