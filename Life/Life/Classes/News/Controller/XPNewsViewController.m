//
//  XPNewsViewController.m
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "XPNewsViewController.h"
#import "NewsListViewController.h"

#import "NewsModel.h"

#import "TopScrollTab.h"

#define kNewsAppKey @"fadeac5f79237ff20be82b8ef912cd49"
#define kNewsPath @"/toutiao/index"

#define kTitles @[@"头条", @"社会", @"国内", @"国际", @"娱乐", @"体育", @"军事", @"科技", @"财经", @"时尚"]

@interface XPNewsViewController ()<TopScrollTabDelegate>

@property (nonatomic, strong) TopScrollTab *topTab;

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) NewsListViewController *newsVC;

@end

@implementation XPNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_configureUI];
    [self p_requstNewsDataWithKey:@"top"];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)p_configureUI
{
    [self topTab];
    [self addNewsList];
}

- (void)addNewsList
{
    
}

- (void)p_requstNewsDataWithKey:(NSString *)key
{
    [HDFHud show];
    NSDictionary *parame = @{@"key": kNewsAppKey, @"type": key};
    [[XPNet sharedNet] requestAtPath:kNewsPath type:Get params:parame success:^(XPResponse *reponse) {
        if (!kIsInvalidDict(reponse.result)) {
            [self p_handleData:reponse.result[@"data"]];
            [HDFHud dismiss];
        }
    } failBlock:^(id errorMsg, XPResponse *reponse) {
        
    }];
}

- (void)p_handleData:(NSArray *)dataArr
{
    _dataSource = [NewsModel mj_objectArrayWithKeyValuesArray:dataArr];
    
}

-(void)topScrollTabDidSelectedTitle:(NSString *)title
{
    [self p_requstNewsDataWithKey:title];
}

- (TopScrollTab *)topTab
{
    if (!_topTab) {
        _topTab = [[TopScrollTab alloc] initWithTitles:kTitles];
        _topTab.tapDelegate = self;
        _topTab.frame = CGRectMake(0, kNavBarHeight, kScreenWidth, 44);
        [self.view addSubview:_topTab];
    }
    return _topTab;
}



@end
