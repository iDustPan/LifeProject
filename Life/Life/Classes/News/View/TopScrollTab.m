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

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UILabel *selectedLabel;

@end

@implementation TopScrollTab

- (instancetype)initWithTitles:(NSArray *)titles
{
    if (self = [super init]) {
        [self backScroll];
        [self p_configureUIWithTitles:titles];
    }
    return self;
}

- (void)selectTitleAtIndex:(NSInteger)index
{
    UILabel *label = self.backScroll.subviews[index];
    [self handleTapAction:label];
}

- (void)p_configureUIWithTitles:(NSArray *)titles
{
    _titles = titles;
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = (NSString *)obj;
        [self p_creatLabelWithTitle:title index:idx];
    }];
}

- (void)p_creatLabelWithTitle:(NSString *)title index:(NSInteger)idx
{
    UILabel *label = [[UILabel alloc] init];
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTitleAction:)]];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = kFontWithSize(15);
    
    label.frame = CGRectMake(idx * 46, 0, 46, 44);
//    NSLog(@"%@", NSStringFromCGRect(label.frame));
    if (_titles.count - 1 != idx) { 
        [self showLineWithRect:CGRectMake(label.width - 1, label.height * 0.3, 1, label.height * 0.4) inSuperView:label];
    }
    
    [_backScroll addSubview:label];
    
    if (_titles.count - 1 == idx) {
        _backScroll.contentSize = CGSizeMake(label.width * _titles.count, 44);
    }
    
}

- (void)tapTitleAction:(UITapGestureRecognizer *)sender
{
    UILabel *label = (UILabel *)sender.view;
    [self handleTapAction:label];
    if (self.tapDelegate && [self.tapDelegate respondsToSelector:@selector(topScrollTabDidSelectedTitle:atIndex:)]) {
        [self.tapDelegate topScrollTabDidSelectedTitle:label.text atIndex:[self.backScroll.subviews indexOfObject:label]];
    }
}

- (void)handleTapAction:(UILabel *)label
{
    _selectedLabel.textColor = [UIColor blackColor];
    label.textColor = [UIColor redColor];
    _selectedLabel = label;
    
    CGFloat offsetX = (label.centerX - kScreenWidth * 0.5);
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    if (offsetX > (self.backScroll.contentSize.width - kScreenWidth)) {
        offsetX = self.backScroll.contentSize.width - kScreenWidth;
    }
    [self.backScroll setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

- (UIScrollView *)backScroll
{
    if (!_backScroll) {
        _backScroll = [[UIScrollView alloc] init];
        _backScroll.bounces = NO;
        _backScroll.frame = CGRectMake(0, 0, kScreenWidth, 44);
        _backScroll.showsHorizontalScrollIndicator = NO;
        
        CALayer *separator = [CALayer layer];
        separator.backgroundColor = HexColor(0xdcdcdc).CGColor;
        separator.frame = CGRectMake(0, 43.5, kScreenWidth, 0.5);
        [self.layer addSublayer:separator];
        [self addSubview:_backScroll];
    }
    return _backScroll;
}


@end
