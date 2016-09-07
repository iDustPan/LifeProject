//
//  NewsModel.h
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject <NSCoding>

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *author_name;

@property (nonatomic, copy) NSString *thumbnail_pic_s;
@property (nonatomic, copy) NSString *thumbnail_pic_s02;
@property (nonatomic, copy) NSString *thumbnail_pic_s03;

@property (nonatomic, copy) NSString *url;

@end
