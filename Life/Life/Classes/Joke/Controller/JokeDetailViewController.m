//
//  JokeDetailViewController.m
//  Life
//
//  Created by 徐攀 on 2016/9/22.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "JokeDetailViewController.h"
#import "popAnimator.h"


@interface JokeDetailViewController ()<UINavigationControllerDelegate>

@property (nonatomic, strong, readwrite) JokeModel *jokeModel;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong, readwrite) UIImageView *picView;

@end

@implementation JokeDetailViewController

- (instancetype)initWithJokeModel:(JokeModel *)model
{
    if (!(self = [super init])) {return nil;}
    _jokeModel = model;
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_configureUI];
    
    self.navigationController.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIColor imageWithColor:HexColor(0x54AEFF)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)p_configureUI
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.frame = self.view.bounds;
    [self.view addSubview:_scrollView];
    
    _picView = [[UIImageView alloc] init];
    _picView.contentMode = UIViewContentModeScaleAspectFill;
    _picView.center = CGPointMake(kScreenWidth * 0.5, kScreenHeight * 0.5);
    _picView.bounds = CGRectMake(0, 0, kScreenWidth, 200);
    [_scrollView addSubview:_picView];
    
    [_picView sd_setImageWithURL:[NSURL URLWithString:_jokeModel.url] placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        _picView.bounds = CGRectMake(0, 0, kScreenWidth, kScreenWidth * image.size.height / image.size.width);
        if (kScreenWidth * image.size.height / image.size.width > kScreenHeight) {
            _picView.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth * image.size.height / image.size.width);
            _scrollView.contentSize = CGSizeMake(kScreenWidth, _picView.height);
        }
    }];
    
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return [popAnimator new];
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
