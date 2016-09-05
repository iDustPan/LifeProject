//
//  TopScrollTab.m
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "TopScrollTab.h"

@interface TopScrollTab ()

@property (nonatomic, strong) UIScrollView *backScroll;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TopScrollTab

- (instancetype)initWithTitles:(NSArray *)titles
{
    if (!(self = [super init])) {
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backScroll.frame = CGRectMake(0, 0, kScreenWidth, self.height);
}

- (UIScrollView *)backScroll
{
    if (!_backScroll) {
        _backScroll = [[UIScrollView alloc] init];
    }
    return _backScroll;
}


@end
