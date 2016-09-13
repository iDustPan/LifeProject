//
//  JokeCell.m
//  Life
//
//  Created by 徐攀 on 16/9/13.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "JokeCell.h"

@interface JokeCell ()

@property (nonatomic, strong) UIView *background;

@property (nonatomic, strong) UILabel *jokeLabel;

@end

@implementation JokeCell

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {return nil;}
    [self p_configureUI];
    return self;
}

- (void)p_configureUI
{
    self.contentView.backgroundColor = HexColor(0xEBEBF1);
    // 白色背景
    if (_background == nil) {
        _background = [[UIView alloc] init];
        _background.backgroundColor = [UIColor whiteColor];
        _background.layer.cornerRadius = 4;
        [self.contentView addSubview:_background];
    }
    
    // 笑话文本框
    if (!_jokeLabel) {
        _jokeLabel = [[UILabel alloc] init];
        _jokeLabel.numberOfLines = 0;
        _jokeLabel.font = kFontWithSize(14);
        [_background addSubview:_jokeLabel];
    }
    
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
    [_background mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    [_jokeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
    }];

    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [super updateConstraints];
}

@end
