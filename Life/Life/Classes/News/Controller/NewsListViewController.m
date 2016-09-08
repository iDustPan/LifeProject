//
//  NewsListViewController.m
//  Life
//
//  Created by 徐攀 on 16/9/6.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "NewsListViewController.h"
#import "NewsDetailViewController.h"
#import "NewsListFrame.h"
#import "NewsModel.h"
#import "NewsListCell.h"
#import "DataManager.h"

#define kNewsAppKey @"fadeac5f79237ff20be82b8ef912cd49"
#define kNewsPath @"/toutiao/index"

@interface NewsListViewController ()

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, copy) NSString *key;

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:NewsListCell.class forCellReuseIdentifier:NSStringFromClass(NewsListCell.class)];
    [self addRefreshControll];
}

- (void)addRefreshControll
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self p_requstNewsDataWithKey:_key];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)refreshNewsListWithTitle:(NSString *)title
{
    // 1.先看本地有无数据，如果有先从本地加载；
    // 2.如果本地没有，从网络加载；
    // 3.网络加载后把数据存本地；
    _key = title;
    [[DataManager sharedManager] loadDataWithKey:title successBlock:^(id result) {
            if (result == nil) {
                [self p_requstNewsDataWithKey:title];
                return ;
            }
            _dataSource = result;
            [self reloadTableView];
    }];
}

- (void)p_requstNewsDataWithKey:(NSString *)key
{
    NSDictionary *parame = @{@"key": kNewsAppKey, @"type": key};
    [[XPNet sharedNet] requestAtPath:kNewsPath type:Get params:parame success:^(XPResponse *reponse) {
        if (!kIsInvalidDict(reponse.result)) {
            [self p_handleData:reponse.result[@"data"] withKey:key];
        }
    } failBlock:^(id errorMsg, XPResponse *reponse) {
        
    }];
}


- (void)p_handleData:(NSArray *)dataArr withKey:(NSString *)key
{
    _dataSource = [NewsModel mj_objectArrayWithKeyValuesArray:dataArr];
    
    NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:42];
    for (NewsModel *model in _dataSource) {
        if (kIsEmptyString(model.title) || model.title == nil) {
            continue;
        }
        NewsListFrame *frameModel = [[NewsListFrame alloc] initWithModel:model];
        [tempArr addObject:frameModel];
    }
    
    _dataSource = tempArr.copy;
    [self reloadTableView];
    [[DataManager sharedManager] saveData:tempArr withKey:key];
}

- (void)reloadTableView
{
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
//    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(NewsListCell.class) forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(NewsListCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.frameModel = _dataSource[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsListFrame *frame = _dataSource[indexPath.row];
    return frame.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsModel *model = [_dataSource[indexPath.row] newsModel];
    NewsDetailViewController *detailVC = [[NewsDetailViewController alloc] initWithURL:[NSURL URLWithString:model.url]];
    UINavigationController *nav = [UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0];
    [nav pushViewController:detailVC animated:YES];
}



@end
