//
//  XPJokeViewController.m
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "XPJokeViewController.h"

#import "JokeAndPicModel.h"

#import "JokeCell.h"



@interface XPJokeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *jokeTableView;
@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger pageSize;

@end

@implementation XPJokeViewController

static NSString * const kJokeKey = @"1ab6fb87c1405ae766ecf36b20c0207c";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_configureUI];
    
    [_jokeTableView registerClass:JokeCell.class forCellReuseIdentifier:NSStringFromClass(JokeCell.class)];
    
    self.dataSource = @[];
    [self p_initialRequstParame];
    [self addRefreshControll];
}

- (void)p_initialRequstParame
{
    _currentPage = 1;
    _pageSize = 10;
    [self p_requestJokeList];
}

- (void)p_requestJokeList
{
    NSDictionary *param = @{
                            @"key": kJokeKey,
                            @"page": [NSString stringWithFormat:@"%ld", _currentPage],
                            @"pagesize": [NSString stringWithFormat:@"%ld", _pageSize]
                            };
    
    NSMutableArray *tempArr = self.dataSource.mutableCopy;
    [[XPNet sharedNet] requestAtURL:@"http://japi.juhe.cn/joke/img/text.from" type:Get params:param success:^(XPResponse *reponse) {
        
        if (_currentPage == 1) {
            [tempArr removeAllObjects];
        }
        
        NSArray *modelArr = [JokeModel mj_objectArrayWithKeyValuesArray:reponse.result[@"data"]];
        
        [tempArr addObjectsFromArray:modelArr];
        self.dataSource = tempArr;
        
        [self.jokeTableView reloadData];
        [self.jokeTableView.mj_header endRefreshing];
        [self.jokeTableView.mj_footer endRefreshing];
        
    } failBlock:^(NSString *errorMsg, XPResponse *reponse) {
        
    }];
}

- (void)addRefreshControll
{
    self.jokeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self p_initialRequstParame];
    }];
    
    self.jokeTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self p_willDragRefresh];
    }];
    
    [self.jokeTableView.mj_header beginRefreshing];
    [self.jokeTableView.mj_footer beginRefreshing];
}

- (void)p_willDragRefresh
{
    _currentPage += 1;
    _pageSize = 10;
    [self p_requestJokeList];
}

- (void)p_configureUI
{
    _jokeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _jokeTableView.estimatedRowHeight = 200;
    _jokeTableView.rowHeight = UITableViewAutomaticDimension;
    _jokeTableView.backgroundColor =HexColor(0xEBEBF1);
    _jokeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _jokeTableView.dataSource = self;
    [self.view addSubview:_jokeTableView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    [_jokeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsZero);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JokeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(JokeCell.class) forIndexPath:indexPath];
    cell.jokemodel = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
