//
//  NewsDetailViewController.m
//  Life
//
//  Created by 徐攀 on 16/9/6.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "NewsModel.h"

@interface NewsDetailViewController ()<UIWebViewDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) NSURL *URL;
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation NewsDetailViewController
- (IBAction)goBack:(UIButton *)sender {
    [_webView goBack];
}

- (IBAction)goHead:(UIButton *)sender {
    [_webView goForward];
}

- (IBAction)refresh:(UIButton *)sender {
    [_webView reload];
}

- (instancetype)initWithURL:(NSURL *)URL
{
    self = [super init];
    if (!self ) return nil;
    _URL = URL;
    [self configureUI];
    return self;
}

- (void)configureUI
{
    _webView = [[UIWebView alloc] init];
    _webView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-44);
    [self.view addSubview:_webView];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:kImageWithName(@"backwrite") forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0, 24, 24);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
    NSURLRequest *request = [NSURLRequest requestWithURL:_URL];
    [_webView loadRequest:request];
}


- (void)backButtonAction:(UIButton *)sender
{
    [self.webView canGoBack] ? [self.webView goBack] : [self.navigationController popViewControllerAnimated:YES];
}

@end
