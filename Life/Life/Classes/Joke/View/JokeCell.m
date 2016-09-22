//
//  JokeCell.m
//  Life
//
//  Created by 徐攀 on 16/9/13.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "JokeCell.h"
#import "JokeAndPicModel.h"

@interface JokeCell ()

@property (nonatomic, strong) UIView *background;

@property (nonatomic, strong) UILabel *jokeLabel;

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, assign) CGFloat imageHeight;

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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self p_configureUI];
    return self;
}

- (void)setJokemodel:(JokeModel *)jokemodel
{
    _jokemodel = jokemodel;
    _jokeLabel.text = [jokemodel.content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [_imgView sd_setImageWithURL:[NSURL URLWithString:jokemodel.url] placeholderImage:nil options:SDWebImageProgressiveDownload];
    [self setNeedsUpdateConstraints];

}

- (void)p_configureUI
{
    self.contentView.backgroundColor = HexColor(0xEBEBF1);
    // 白色背景
    _background = [[UIView alloc] init];
    _background.backgroundColor = [UIColor whiteColor];
    _background.layer.cornerRadius = 4;
    [self.contentView addSubview:_background];
    
    // 笑话文本框
    _jokeLabel = [[UILabel alloc] init];
    _jokeLabel.numberOfLines = 0;
    _jokeLabel.font = [UIFont systemFontOfSize:18];
    [_background addSubview:_jokeLabel];
    
    _imgView = [[UIImageView alloc] init];
    _imgView.contentMode = UIViewContentModeScaleAspectFill;
    _imgView.clipsToBounds = YES;
    [_background addSubview:_imgView];
    
    [self p_creatConstraint];
}

- (void)p_creatConstraint
{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [_background mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.width.mas_equalTo(kScreenWidth - 20);
    }];
    
    [_jokeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8);
        make.left.mas_equalTo(8);
        make.right.mas_equalTo(-8);
    }];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_jokeLabel.mas_bottom).offset(8);
        make.left.right.equalTo(_jokeLabel);
    }];
}

- (void)updateConstraints
{
//    NSLog(@"%f", _imageHeight);
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(200);
    }];
    
    [_background mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_imgView).offset(5);
    }];
    
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_background).offset(10);
    }];
    
    [super updateConstraints];
}

@end
