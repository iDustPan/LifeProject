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
    [self p_requstNewsDataWithKey:title];
}

- (void)p_requstNewsDataWithKey:(NSString *)key
{
    [HDFHud show];
    NSDictionary *parame = @{@"key": kNewsAppKey, @"type": key};
    [[XPNet sharedNet] requestAtPath:kNewsPath type:Get params:parame success:^(XPResponse *reponse) {
        if (!kIsInvalidDict(reponse.result)) {
            [self p_handleData:reponse.result[@"data"]];
        }
    } failBlock:^(id errorMsg, XPResponse *reponse) {
        
    }];
}

- (void)p_handleData:(NSArray *)dataArr
{
    _dataSource = [NewsModel mj_objectArrayWithKeyValuesArray:dataArr];
    
    NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:42];
    [_dataSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NewsListFrame *frameModel = [[NewsListFrame alloc] initWithModel:obj];
        [tempArr addObject:frameModel];
    }];
    
    _dataSource = tempArr.copy;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    [HDFHud dismiss];
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
//    [self showViewController:detailVC sender:self];
}

@end
