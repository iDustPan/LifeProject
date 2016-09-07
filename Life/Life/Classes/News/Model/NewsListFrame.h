//
//  NewsListFrame.h
//  Life
//
//  Created by 徐攀 on 16/9/6.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewsModel;
@interface NewsListFrame : NSObject


@property (nonatomic, strong) NewsModel *newsModel;

@property (nonatomic, assign, readonly) CGRect newsLabelFrame;
@property (nonatomic, assign, readonly) CGRect image1Frame;
@property (nonatomic, assign, readonly) CGRect image2Frame;
@property (nonatomic, assign, readonly) CGRect image3Frame;
@property (nonatomic, assign, readonly) CGRect dateFrame;
@property (nonatomic, assign, readonly) CGRect sourceFrame;

@property (nonatomic, assign, readonly) CGFloat cellHeight;

- (instancetype)initWithModel:(NewsModel *)model;

@end
