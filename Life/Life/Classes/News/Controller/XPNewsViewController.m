//
//  XPNewsViewController.m
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "XPNewsViewController.h"


#define kNewsAppKey @"fadeac5f79237ff20be82b8ef912cd49"
#define kNewsPath @"/toutiao/235"

@interface XPNewsViewController ()

@end

@implementation XPNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_requstNewsData];
}

- (void)p_requstNewsData
{
    NSDictionary *parame = @{@"key": kNewsAppKey};
    [[XPNet sharedNet] requestAtPath:kNewsPath type:Get params:parame success:^(XPResponse *reponse) {
        NSLog(@"%@", reponse.result);
    } failBlock:^(id errorMsg, XPResponse *reponse) {
        
    }];
}


@end
