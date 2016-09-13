//
//  XPJokeViewController.m
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "XPJokeViewController.h"


#import "JokeCell.h"

@interface XPJokeViewController ()<UITableViewDataSource>

@property (nonatomic, strong) UITableView *jokeTableView;

@end

@implementation XPJokeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_configureUI];
    
    [_jokeTableView registerClass:JokeCell.class forCellReuseIdentifier:NSStringFromClass(JokeCell.class)];
}

- (void)p_configureUI
{
    _jokeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _jokeTableView.rowHeight = 200;
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JokeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(JokeCell.class) forIndexPath:indexPath];
    return cell;
}


@end
