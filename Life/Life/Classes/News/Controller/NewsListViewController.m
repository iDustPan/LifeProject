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

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:NewsListCell.class forCellReuseIdentifier:NSStringFromClass(NewsListCell.class)];
}

- (void)refreshNewsListWithTitle:(NSString *)title
{
    // 1.先看本地有无数据，如果有先从本地加载；
    // 2.如果本地没有，从网络加载；
    // 3.网络加载后把数据存本地；
    [[DataManager sharedManager] loadDataWithKey:title successBlock:^(id result) {
        AppLog(@"%@", result);
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
    [HDFHud show];
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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [_dataSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NewsListFrame *frameModel = [[NewsListFrame alloc] initWithModel:obj];
            [tempArr addObject:frameModel];
        }];
        
        [[DataManager sharedManager] saveData:tempArr withKey:key];
        dispatch_async(dispatch_get_main_queue(), ^{
            _dataSource = tempArr.copy;
            [self reloadTableView];
            [HDFHud dismiss];
        });
    });
}

- (void)reloadTableView
{
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
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
    return [_dataSource[indexPath.row] cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsModel *model = [_dataSource[indexPath.row] newsModel];
    NewsDetailViewController *detailVC = [[NewsDetailViewController alloc] initWithURL:[NSURL URLWithString:model.url]];
    UINavigationController *nav = [UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0];
    [nav pushViewController:detailVC animated:YES];
}

@end
