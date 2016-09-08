//
//  NewsDetailViewController.m
//  Life
//
//  Created by 徐攀 on 16/9/6.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "NewsModel.h"

@interface NewsDetailViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *tab;
@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;
@property (weak, nonatomic) IBOutlet UIButton *gobackBtn;
@property (weak, nonatomic) IBOutlet UIButton *goheadBtn;


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
    _tab = [[NSBundle mainBundle] loadNibNamed:@"WebViewTabBar" owner:self options:nil].lastObject;
    _tab.frame = CGRectMake(0, kScreenHeight - 44, kScreenWidth, 44);
    [self.view addSubview:_tab];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc] init];
    _webView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-44);
    [self.view addSubview:_webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:_URL];
    [_webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.gobackBtn.enabled = [_webView canGoBack];
    self.goheadBtn.enabled = [_webView canGoForward];
}

@end
