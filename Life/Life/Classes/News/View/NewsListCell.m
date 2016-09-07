//
//  NewsListCell.m
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "NewsListCell.h"
#import "NewsListFrame.h"
#import "NewsModel.h"

@interface NewsListCell ()

@property (nonatomic, strong) UILabel *newsLabel;
@property (nonatomic, strong) UIImageView *image1;
@property (nonatomic, strong) UIImageView *image2;
@property (nonatomic, strong) UIImageView *image3;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *sourceLabel;

@end

@implementation NewsListCell


//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    
//    if (!self) return nil;
//    
//    return self;
//}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.newsLabel.frame = _frameModel.newsLabelFrame;
    self.image1.frame = _frameModel.image1Frame;
    self.image2.frame = _frameModel.image2Frame;
    self.image3.frame = _frameModel.image3Frame;
    self.sourceLabel.frame = _frameModel.sourceFrame;
    self.dateLabel.frame = _frameModel.dateFrame;
}


- (void)setFrameModel:(NewsListFrame *)frameModel
{
    _frameModel = frameModel;
    self.newsLabel.text = frameModel.newsModel.title;
    [self.image1 sd_setImageWithURL:[NSURL URLWithString:frameModel.newsModel.thumbnail_pic_s]];
    [self.image2 sd_setImageWithURL:[NSURL URLWithString:frameModel.newsModel.thumbnail_pic_s02]];
    [self.image3 sd_setImageWithURL:[NSURL URLWithString:frameModel.newsModel.thumbnail_pic_s03]];
    self.sourceLabel.text = frameModel.newsModel.author_name;
    self.dateLabel.text = frameModel.newsModel.date;
}

- (UILabel *)newsLabel
{
    if (!_newsLabel) {
        _newsLabel = [[UILabel alloc] init];
        _newsLabel.font = kFontWithSize(16);
        _newsLabel.numberOfLines = 0;
        [self.contentView addSubview:_newsLabel];
    }
    return _newsLabel;
}

- (UIImageView *)image1
{
    if (!_image1) {
        _image1 = [[UIImageView alloc] init];
        [self.contentView addSubview:_image1];
    }
    return _image1;
}

- (UIImageView *)image2
{
    if (!_image2) {
        _image2 = [[UIImageView alloc] init];
        [self.contentView addSubview:_image2];
    }
    return _image2;
}

- (UIImageView *)image3
{
    if (!_image3) {
        _image3 = [[UIImageView alloc] init];
        [self.contentView addSubview:_image3];
    }
    return _image3;
}

- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.font = kFontWithSize(12);
        _dateLabel.textColor = HexColor(0x969696);
        [self.contentView addSubview:_dateLabel];
    }
    return _dateLabel;
}

- (UILabel *)sourceLabel
{
    if (!_sourceLabel) {
        _sourceLabel = [[UILabel alloc] init];
        _sourceLabel.font = kFontWithSize(12);
        _sourceLabel.textColor = HexColor(0x969696);
        [self.contentView addSubview:_sourceLabel];
    }
    return _sourceLabel;
}

@end
