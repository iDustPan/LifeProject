//
//  NewsDetailViewController.m
//  Life
//
//  Created by 徐攀 on 16/9/6.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "NewsModel.h"

@interface NewsDetailViewController ()

@property (nonatomic, strong) NSURL *URL;

@end

@implementation NewsDetailViewController

- (instancetype)initWithURL:(NSURL *)URL
{
    self = [super init];
    if (!self ) return nil;
    _URL = URL;
    return self;
}

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    self.view = webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = (UIWebView *)self.view;
    NSURLRequest *request = [NSURLRequest requestWithURL:_URL];
    [webView loadRequest:request];
}


@end
