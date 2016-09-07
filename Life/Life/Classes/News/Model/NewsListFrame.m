//
//  NewsListFrame.m
//  Life
//
//  Created by 徐攀 on 16/9/6.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "NewsListFrame.h"
#import "NewsModel.h"

@implementation NewsListFrame
MJCodingImplementation

- (instancetype)initWithModel:(NewsModel *)model
{
    if (!(self = [super init])) return nil;
    
    _newsModel = model;
    [self p_calculateFrame:model];
    return self;
}

- (void)p_calculateFrame:(NewsModel *)model
{
    
    if ([self hasImage:model]) {
        [self caculateFrameWithOneImage:model];
    }
    
    if ([self noImage:model]) {
        [self caculateFrameWithNoImage:model];
    }
    _cellHeight = CGRectGetMaxY(_dateFrame) + 10;
}

- (void)caculateFrameWithThreeImage:(NewsModel *)model
{
    CGFloat titleWidth = kScreenWidth - 20;
    CGFloat titleHeight = [model.title size2FitWithFont:kFontWithSize(16) containerWidth:titleWidth mutableLines:NO].height;
    _newsLabelFrame = CGRectMake(10, 8, titleWidth, titleHeight);

    CGFloat imageY = _newsLabelFrame.size.height + 8;
    _image1Frame = CGRectMake(10, imageY, imageSize().width, imageSize().height);
    _image2Frame = CGRectMake(10 + imageSize().width, imageY, imageSize().width, imageSize().height);
    _image3Frame = CGRectMake(10 + 2 * imageSize().width + 10, imageY, imageSize().width, imageSize().height);
    
    _sourceFrame = CGRectMake(10, CGRectGetMaxY(_image3Frame) + 7, sourceSize(model).width, sourceSize(model).height);
    _dateFrame = CGRectMake(kScreenWidth - dateSize(model).width - 10, CGRectGetMaxY(_image3Frame) + 7, dateSize(model).width, dateSize(model).height);
}

- (void)caculateFrameWithOneImage:(NewsModel *)model
{
    _image1Frame = CGRectMake(kScreenWidth - 10 - imageSize().width, 8, imageSize().width, imageSize().height);
    
    CGFloat titleWidth = kScreenWidth - 20 - imageSize().width - 10;
    CGFloat titleHeight = [model.title size2FitWithFont:kFontWithSize(16) containerWidth:titleWidth mutableLines:YES].height;
    _newsLabelFrame = CGRectMake(10, 8, titleWidth, titleHeight);

    CGFloat sourceY = CGRectGetMaxY(_image1Frame) - sourceSize(model).height;
    _sourceFrame = CGRectMake(10, sourceY, sourceSize(model).width, sourceSize(model).height);
    _dateFrame = CGRectMake(CGRectGetMinX(_image1Frame) - 10 - dateSize(model).width, sourceY, dateSize(model).width, dateSize(model).height);
}

- (void)caculateFrameWithNoImage:(NewsModel *)model
{
    CGFloat titleWidth = kScreenWidth - 20;
    CGFloat titleHeight = [model.title size2FitWithFont:kFontWithSize(16) containerWidth:titleWidth mutableLines:YES].height;
    _newsLabelFrame = CGRectMake(10, 8, titleWidth, titleHeight);
    
    _sourceFrame = CGRectMake(10, CGRectGetMaxY(_newsLabelFrame) + 7,sourceSize(model).width, sourceSize(model).height);
    _dateFrame = CGRectMake(kScreenWidth - 10 - dateSize(model).width, CGRectGetMaxY(_newsLabelFrame) + 7, dateSize(model).width, dateSize(model).height);
}

/// 没有三张图片但至少有一张
- (BOOL)hasImage:(NewsModel *)model
{
    return (model.thumbnail_pic_s03.length != 0
            || model.thumbnail_pic_s02.length != 0
            || model.thumbnail_pic_s.length != 0);
}

/// 没有图片
- (BOOL)noImage:(NewsModel *)model
{
    return (model.thumbnail_pic_s.length == 0
            && model.thumbnail_pic_s02.length == 0
            && model.thumbnail_pic_s03.length == 0);
}

CGSize sourceSize(NewsModel *model) {
    return [model.author_name size2FitWithFont:kFontWithSize(12) containerWidth:MAXFLOAT mutableLines:NO];
}

CGSize dateSize(NewsModel *model) {
    return [model.date size2FitWithFont:kFontWithSize(12) containerWidth:MAXFLOAT mutableLines:NO];
}

CGSize imageSize() {
    return CGSizeMake((kScreenWidth - 20) / 4, 240.0 / 320 * ((kScreenWidth - 20) / 4));
}

+ (NSArray *)mj_allowedCodingPropertyNames
{
    return @[@"newsLabelFrame", @"image1Frame", @"dateFrame", @"sourceFrame", @"newsModel", @"cellHeight"];
}


@end
